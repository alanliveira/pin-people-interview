FactoryBot.define do
  factory :company_department do
    company

    name { Faker::Company.department }
    role_type { 'department' }
  end
end
