require 'rails_helper'

RSpec.describe Company, type: :model do
  subject { create(:company) }

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:name).with_message("can't be blank") }
  end

  context 'associations' do
    it { is_expected.to have_many(:positions) }
    it { is_expected.to have_many(:positions).dependent(:destroy) }
    it { is_expected.to have_many(:departments) }
    it { is_expected.to have_many(:departments).dependent(:destroy) }
    it { is_expected.to have_many(:functions) }
    it { is_expected.to have_many(:functions).dependent(:destroy) }
  end
end
