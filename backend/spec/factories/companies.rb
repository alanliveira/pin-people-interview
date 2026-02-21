FactoryBot.define do
  factory :company do
    transient do
      departments_count { 3 }
      positions_count { 3 }
      functions_count { 3 }
    end

    name { Faker::Company.name }

    trait :with_roles do
      after(:create) do |company, evaluator|
        create_list(:company_department, evaluator.departments_count, company: company)
        create_list(:company_position, evaluator.positions_count, company: company)
        create_list(:company_function, evaluator.functions_count, company: company)
      end
    end

    trait :with_departments do
      after(:create) do |company, evaluator|
        create_list(:department, evaluator.departments_count, company: company)
      end
    end

    trait :with_positions do
      after(:create) do |company, evaluator|
        create_list(:company_position, evaluator.positions_count, company: company)
      end
    end

    trait :with_functions do
      after(:create) do |company, evaluator|
        create_list(:company_function, evaluator.functions_count, company: company)
      end
    end
  end
end
