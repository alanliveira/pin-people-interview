require 'rails_helper'

RSpec.describe Search, type: :model do
  subject { create(:search) }

  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_most(255) }
  end

  context "associations" do
    it { is_expected.to belong_to(:company) }
    it { is_expected.to have_many(:questions).dependent(:destroy) }
    it { is_expected.to have_many(:question_answers).dependent(:destroy) }
  end

  describe "#conversion_rate" do
    let(:company) { create(:company) }
    let(:search) { create(:search, company: company) }
    let(:employee1) { create(:employee, company: company) }
    let(:employee2) { create(:employee, company: company) }

    before do
      create(:question_answer, search: search, employee: employee1, completed_at: Time.current)
      create(:question_answer, search: search, employee: employee2)
    end

    it "calculates the conversion rate correctly" do
      expect(search.conversion_rate).to eq(100.0)
    end
  end
end
