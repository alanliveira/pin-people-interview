FactoryBot.define do
  factory :level_management do
    association :company

    name { Faker::Company.industry }
    role_type { "management" }
  end
end
