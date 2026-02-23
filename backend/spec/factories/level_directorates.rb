FactoryBot.define do
  factory :level_directorate do
    association :company

    name { Faker::Company.industry }
    role_type { 'directorate' }
  end
end
