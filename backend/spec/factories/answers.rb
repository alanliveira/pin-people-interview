FactoryBot.define do
  factory :answer do
    association :question
    association :question_answer

    comment { Faker::Lorem.sentence }
    value { rand(1..10) }
  end
end
