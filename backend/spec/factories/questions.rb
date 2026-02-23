FactoryBot.define do
  factory :question do
    search

    description { Faker::Lorem.paragraph }
    question_type { %w[text likert nps].sample }
  end
end
