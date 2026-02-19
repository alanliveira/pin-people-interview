

namespace :data do
  desc "Import data from db/data.csv and print the 'name' column"
  task import: :environment do
    path = Rails.root.join("db", "data.csv")
    headers = [ "nome",
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
                "[Aberta] eNPS" ]

    CsvImportService.call(path: path, headers: headers)
  end
end
