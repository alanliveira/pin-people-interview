require 'rails_helper'

RSpec.describe LevelDirectorate, type: :model do
  subject { create(:level_directorate) }

  context 'associations' do
    it { is_expected.to belong_to(:company) }
    it { is_expected.to have_many(:employees).dependent(:nullify) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'enums' do
    it { is_expected.to define_enum_for(:role_type)
                    .with_values(directorate: "directorate")
                    .backed_by_column_of_type(:string) }
  end

  context 'callbacks' do
    it 'sets role_type to directorate before creation' do
      company_directorate = build(:level_directorate, role_type: nil)
      company_directorate.save
      expect(company_directorate.role_type).to eq("directorate")
    end
  end

  context 'default scope' do
    it 'only includes records with role_type directorate' do
      create(:level_directorate)
      create(:level_coordination)

      expect(LevelDirectorate.count).to eq(1)
      expect(LevelDirectorate.first.role_type).to eq("directorate")
    end
  end
end
