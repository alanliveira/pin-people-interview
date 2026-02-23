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
  end
end
