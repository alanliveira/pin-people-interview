FactoryBot.define do
  factory :level_management do
    company

    name { Faker::Company.industry }
    role_type { "management" }
  end
end
