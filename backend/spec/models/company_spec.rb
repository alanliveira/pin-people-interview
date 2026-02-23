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

    it { is_expected.to have_many(:employees) }
    it { is_expected.to have_many(:employees).dependent(:destroy) }

    it { is_expected.to have_many(:directorates) }
    it { is_expected.to have_many(:directorates).dependent(:destroy) }
    it { is_expected.to have_many(:managements) }
    it { is_expected.to have_many(:managements).dependent(:destroy) }
    it { is_expected.to have_many(:coordinations) }
    it { is_expected.to have_many(:coordinations).dependent(:destroy) }
    it { is_expected.to have_many(:areas) }
    it { is_expected.to have_many(:areas).dependent(:destroy) }
  end
end
