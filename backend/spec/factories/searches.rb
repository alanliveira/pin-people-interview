FactoryBot.define do
  factory :search do
    association :company

    title { Faker::Lorem.sentence }
  end
end
