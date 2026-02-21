require 'rails_helper'

RSpec.describe LevelManagement, type: :model do
  subject { create(:level_management) }

  context 'associations' do
    it { is_expected.to belong_to(:company) }
    it { is_expected.to have_many(:employees).dependent(:nullify) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'enums' do
    it { is_expected.to define_enum_for(:role_type)
                    .with_values(management: "management")
                    .backed_by_column_of_type(:string) }
  end

  context 'callbacks' do
    it 'sets role_type to management before creation' do
      level_management = build(:level_management, role_type: nil)
      level_management.save
      expect(level_management.role_type).to eq("management")
    end
  end

  context 'default scope' do
    it 'only includes records with role_type management' do
      create(:level_directorate)
      create(:level_management)

      expect(LevelManagement.count).to eq(1)
      expect(LevelManagement.first.role_type).to eq("management")
    end
  end
end
