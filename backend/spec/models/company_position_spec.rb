require 'rails_helper'

RSpec.describe CompanyPosition, type: :model do
  subject { create(:company_position) }

  context 'associations' do
    it { is_expected.to belong_to(:company) }
    it { is_expected.to have_many(:employees).dependent(:nullify) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'enums' do
    it { is_expected.to define_enum_for(:role_type)
                    .with_values(position: "position")
                    .backed_by_column_of_type(:string) }
  end

  context 'callbacks' do
    it 'sets role_type to position before creation' do
      company_position = build(:company_position, role_type: nil)
      company_position.save
      expect(company_position.role_type).to eq("position")
    end
  end

  context 'default scope' do
    it 'only includes records with role_type position' do
      create(:company_department)
      create(:company_position)

      expect(CompanyPosition.count).to eq(1)
      expect(CompanyPosition.first.role_type).to eq("position")
    end
  end
end
