require 'rails_helper'

RSpec.describe LevelCoordination, type: :model do
  subject { create(:level_coordination) }

  context 'associations' do
    it { is_expected.to belong_to(:company) }
    it { is_expected.to have_many(:employees).dependent(:nullify) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'enums' do
    it { is_expected.to define_enum_for(:role_type)
                    .with_values(coordination: "coordination")
                    .backed_by_column_of_type(:string) }
  end

  context 'callbacks' do
    it 'sets role_type to coordination before creation' do
      company_coordination = build(:level_coordination, role_type: nil)
      company_coordination.save
      expect(company_coordination.role_type).to eq("coordination")
    end
  end

  context 'default scope' do
    it 'only includes records with role_type coordination' do
      create(:level_directorate)
      create(:level_coordination)

      expect(LevelCoordination.count).to eq(1)
      expect(LevelCoordination.first.role_type).to eq("coordination")
    end
  end
end
