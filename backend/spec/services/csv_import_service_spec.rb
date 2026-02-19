require 'rails_helper'

RSpec.describe CsvImportService, type: :service do
  subject { CsvImportService }

  let(:filepath) { Rails.root.join("db", "data.csv") }
  let(:headers) { [ "nome",
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
                    "[Aberta] eNPS" ]}

  describe '.call' do
    it { expect(subject.call(path: filepath, headers: headers)).to be_kind_of(CsvImportService) }
    it { expect(subject.call(path: '', headers: headers)).to eq("Arquivo não encontrado: #{path}") }

    describe '#count' do
      it { expect(subject.call(path: filepath, headers: headers).count).to eq(500) }
    end
  end
end
