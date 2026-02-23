FactoryBot.define do
  factory :level_directorate do
    company

    name { Faker::Company.industry }
    role_type { 'directorate' }
  end
end
