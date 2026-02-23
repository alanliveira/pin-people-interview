require "csv"

class CsvImportService
  attr_reader :data_attributes

  HEADERS = [ "nome",
              "email",
              "email_corporativo",
              "area",
              "cargo",
              "funcao",
              "localidade",
              "tempo_de_empresa",
              "genero", "geracao",
              "n0_empresa",
              "n1_diretoria",
              "n2_gerencia",
              "n3_coordenacao",
              "n4_area",
              "Data da Resposta",
              "Interesse no Cargo",
              "Comentários - Interesse no Cargo",
              "Contribuição",
              "Comentários - Contribuição",
              "Aprendizado e Desenvolvimento",
              "Comentários - Aprendizado e Desenvolvimento",
              "Feedback",
              "Comentários - Feedback",
              "Interação com Gestor",
              "Comentários - Interação com Gestor",
              "Clareza sobre Possibilidades de Carreira",
              "Comentários - Clareza sobre Possibilidades de Carreira",
              "Expectativa de Permanência",
              "Comentários - Expectativa de Permanência",
              "eNPS",
              "[Aberta] eNPS" ].freeze

  def self.call(path: "", is_output_message: false, steps: nil)
    unless File.exist?(path)
      return {
        status: :error,
        message: "File not found: #{path}"
      }
    end

    @data_attributes = []
    CSV.foreach(path, headers: true, encoding: "utf-8", col_sep: ";") do |row|
      next if row.to_h.values.all?(&:nil?)

      @data_attributes << row.to_h
    end

    begin
      @data_attributes.map.each_with_index do |test, index|
        break if steps && index >= steps

        company = Company.find_or_create_by(name: test["n0_empresa"])
        directorate = company.directorates.find_or_create_by(name: test["n1_diretoria"])
        management = company.managements.find_or_create_by(name: test["n2_gerencia"])
        coordination = company.coordinations.find_or_create_by(name: test["n3_coordenacao"])
        area = company.areas.find_or_create_by(name: test["n4_area"])
        department = company.departments.find_or_create_by(name: test["area"])
        position = company.positions.find_or_create_by(name: test["cargo"])
        function = company.functions.find_or_create_by(name: test["funcao"])

        search  = Search.find_or_create_by(company_id: company.id, title: "Pesquisa de Engajamento")

        questions = [
          search.questions.find_or_create_by(description: "Interesse no Cargo"),
          search.questions.find_or_create_by(description: "Contribuição"),
          search.questions.find_or_create_by(description: "Aprendizado e Desenvolvimento"),
          search.questions.find_or_create_by(description: "Feedback"),
          search.questions.find_or_create_by(description: "Interação com Gestor"),
          search.questions.find_or_create_by(description: "Clareza sobre Possibilidades de Carreira"),
          search.questions.find_or_create_by(description: "Expectativa de Permanência"),
          search.questions.find_or_create_by(description: "eNPS")
        ]

        employee = company.employees.find_or_create_by!(
          name: test["nome"],
          email: test["email"],
          corporate_email: test["email_corporativo"],
          location: test["localidade"],
          time_in_company: test["tempo_de_empresa"],
          gender: test["genero"],
          generation: test["geracao"],
          level_directorate_id: directorate.id,
          level_management_id: management.id,
          level_coordination_id: coordination.id,
          level_area_id: area.id,
          company_department_id: department.id,
          company_position_id: position.id,
          company_function_id: function.id,
          company_tenure: test["tempo_de_empresa"]
        )

        questions.each do |question|
          question_answer = QuestionAnswer.find_or_create_by!(
            employee_id: employee.id,
            completed_at: Date.parse(test["Data da Resposta"]),
            search_id: search.id
          )

          answer = Answer.find_or_create_by!(
            question_answer: question_answer,
            question_id: question.id,
            comment: test["Comentários - #{question.description}"],
            value: test[question.description]
          )
        end

        puts "Employee #{employee.name} imported successfully." if is_output_message
      end

      {
        status: :success,
        message: "Import completed successfully."
      }
    rescue => e
      {
        status: :error,
        message: "An error occurred during import: #{e.message}"
      }
    end
  end
end
