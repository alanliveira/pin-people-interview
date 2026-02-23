FactoryBot.define do
  factory :company_function do
    company

    name { Faker::Job.seniority  }
    role_type { 'function' }
  end
end
