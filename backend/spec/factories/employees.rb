FactoryBot.define do
  factory :employee do
    company

    name { Faker::Name.name }
    email { Faker::Internet.email }
    corporate_email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.phone_number }
    location { Faker::Address.city }
    gender { [ "male", "female", "other" ].sample }
    generation { [ "Gen Z", "Millennial", "Gen X", "Baby Boomer" ].sample }
    company_tenure { [ "before 1 year", "between 1 and 2 years", "between 2 and 5 years", "more than 5 years" ].sample }

    after(:build) do |employee|
      employee.department ||= build(:company_department, company: employee.company)
      employee.position   ||= build(:company_position, company: employee.company)
      employee.function   ||= build(:company_function, company: employee.company)
    end
  end
end
