require 'rails_helper'

RSpec.describe CsvImportService, type: :service do
  subject { CsvImportService }

  let(:filepath) { Rails.root.join("db", "data.csv") }

  context '.call' do
    let!(:import) { subject.call(path: filepath, steps: 100) }

    context 'when file exists' do
      it { expect(import).to be_kind_of(Hash) }
      it { expect(import[:status]).to eq(:success) }
      it { expect(import[:message]).to eq("Import completed successfully.") }
    end

    context 'when file does not exist' do
      it { expect(subject.call(path: '')).to be_kind_of(Hash) }
      it { expect(subject.call(path: '')[:status]).to eq(:error) }
      it { expect(subject.call(path: '')[:message]).to eq("File not found: ") }
    end

    context 'when persisted in database' do
      it { expect(Company.count).to eq(1) }
      it { expect(Employee.count).to eq(100) }
      it { expect(QuestionAnswer.count).to eq(100) }
      it { expect(Search.count).to eq(1) }
      it { expect(Question.count).to eq(8) }
      it { expect(Answer.count).to eq(800) }
    end
  end
end
