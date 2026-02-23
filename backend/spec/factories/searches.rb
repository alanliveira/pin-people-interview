FactoryBot.define do
  factory :search do
    company

    title { Faker::Lorem.sentence }
  end
end
