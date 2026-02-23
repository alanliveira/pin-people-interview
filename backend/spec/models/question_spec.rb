require 'rails_helper'

RSpec.describe Question, type: :model do
  subject { create(:question) }

  context "validations" do
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_most(1_000) }
  end

  context "associations" do
    it { is_expected.to belong_to(:search) }
  end

  describe "#likert_distribution" do
    let(:search) { create(:search) }
    let(:question) { create(:question, question_type: :likert, search: search) }

    before do
      create(:answer, question: question, value: 1)
      create(:answer, question: question, value: 2)
      create(:answer, question: question, value: 2)
      create(:answer, question: question, value: 3)
    end

    it "returns the correct distribution" do
      expect(question.likert_distribution).to eq({ 1 => 1, 2 => 2, 3 => 1 })
    end
  end

  describe "#favorability" do
    let(:search) { create(:search) }
    let(:question) { create(:question, question_type: :likert, search: search) }
    before do
      create(:answer, question: question, value: 1)
      create(:answer, question: question, value: 4)
      create(:answer, question: question, value: 5)
    end

    it "calculates favorability correctly" do
      expect(question.favorability).to eq(66.67)
    end
  end
end
