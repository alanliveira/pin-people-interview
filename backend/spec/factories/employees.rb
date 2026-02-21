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
      employee.department         ||= build(:company_department, company: employee.company)
      employee.position           ||= build(:company_position, company: employee.company)
      employee.function           ||= build(:company_function, company: employee.company)
      employee.level_area         ||= build(:level_area, company: employee.company)
      employee.level_directorate  ||= build(:level_directorate, company: employee.company)
      employee.level_management   ||= build(:level_management, company: employee.company)
      employee.level_coordination ||= build(:level_coordination, company: employee.company)
    end
  end
end
