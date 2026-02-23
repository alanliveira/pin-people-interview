FactoryBot.define do
  factory :level_coordination do
    association :company

    name { Faker::Company.department }
    role_type { 'coordination' }
  end
end
