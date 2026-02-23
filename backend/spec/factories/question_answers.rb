FactoryBot.define do
  factory :question_answer do
    search
    employee

    completed_at { DateTime.current }

    before(:create) do |question_answer|
      question_answer.employee ||= create(:employee, company: question_answer.search.company)
    end
  end
end
