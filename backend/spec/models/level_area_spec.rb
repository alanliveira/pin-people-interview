require 'rails_helper'

RSpec.describe LevelArea, type: :model do
  subject { create(:level_area) }

  context 'associations' do
    it { is_expected.to belong_to(:company) }
    it { is_expected.to have_many(:employees).dependent(:nullify) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'enums' do
    it { is_expected.to define_enum_for(:role_type)
                    .with_values(area: "area")
                    .backed_by_column_of_type(:string) }
  end

  context 'callbacks' do
    it 'sets role_type to area before creation' do
      level_area = build(:level_area, role_type: nil)
      level_area.save
      expect(level_area.role_type).to eq("area")
    end
  end

  context 'default scope' do
    it 'only includes records with role_type area' do
      create(:level_area)
      create(:level_management)

      expect(LevelArea.count).to eq(1)
      expect(LevelArea.first.role_type).to eq("area")
    end
  end
end
