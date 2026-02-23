FactoryBot.define do
  factory :level_area do
    association :company

    name { Faker::Company.industry }
    role_type { 'area' }
  end
end
