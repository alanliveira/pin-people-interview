FactoryBot.define do
  factory :company_position do
    association :company

    name { Faker::Job.position }
    role_type { 'position' }
  end
end
