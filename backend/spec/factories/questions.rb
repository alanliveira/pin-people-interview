FactoryBot.define do
  factory :question do
    search

    description { Faker::Lorem.paragraph }
    type { %w[linked text].sample }
  end
end
