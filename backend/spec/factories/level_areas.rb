FactoryBot.define do
  factory :level_area do
    company

    name { Faker::Company.industry }
    role_type { 'area' }
  end
end
