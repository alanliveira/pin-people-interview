require 'rails_helper'

RSpec.describe CompanyFunction, type: :model do
  subject { create(:company_function) }

  context 'associations' do
    it { is_expected.to belong_to(:company) }
    it { is_expected.to have_many(:employees).dependent(:nullify) }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'enums' do
    it { is_expected.to define_enum_for(:role_type)
                    .with_values(function: "function")
                    .backed_by_column_of_type(:string) }
  end

  context 'callbacks' do
    it 'sets role_type to function before creation' do
      company_function = build(:company_function, role_type: nil)
      company_function.save
      expect(company_function.role_type).to eq("function")
    end
  end

  context 'default scope' do
    it 'only includes records with role_type function' do
      create(:company_department)
      create(:company_function)

      expect(CompanyFunction.count).to eq(1)
      expect(CompanyFunction.first.role_type).to eq("function")
    end
  end
end
