require 'rails_helper'

RSpec.describe CompanyDepartment, type: :model do
  subject { create(:company_department) }

  context 'associations' do
    it { is_expected.to belong_to(:company) }
    it { is_expected.to have_many(:employees).dependent(:nullify) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'enums' do
    it { is_expected.to define_enum_for(:role_type)
                    .with_values(department: "department")
                    .backed_by_column_of_type(:string) }
  end

  context 'callbacks' do
    it 'sets role_type to department before creation' do
      company_department = build(:company_department, role_type: nil)
      company_department.save
      expect(company_department.role_type).to eq("department")
    end
  end

  context 'default scope' do
    it 'only includes records with role_type department' do
      create(:company_department)
      create(:company_position)

      expect(CompanyDepartment.count).to eq(1)
      expect(CompanyDepartment.first.role_type).to eq("department")
    end
  end
end
