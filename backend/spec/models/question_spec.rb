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
end
