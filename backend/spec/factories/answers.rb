FactoryBot.define do
  factory :answer do
    question
    comment { Faker::Lorem.sentence }
    value { rand(1..10) }
  end
end
