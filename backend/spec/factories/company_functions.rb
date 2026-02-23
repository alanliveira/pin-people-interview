FactoryBot.define do
  factory :company_function do
    association :company

    name { Faker::Job.seniority  }
    role_type { 'function' }
  end
end
