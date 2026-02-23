class Question < ApplicationRecord
  belongs_to :search
  has_many :answers, dependent: :destroy

  validates :description, presence: true
  validates :description, length: { maximum: 1_000 }

  enum :question_type, {
    linked: "linked",
    text: "text",
    likert: "likert",
    nps: "nps"
  }

  def likert_distribution
    return {} unless likert?
    answers.group(:value).count
  end

  def favorability
    return 0 unless likert?
    total = answers.count
    return 0 if total.zero?
    favorable = answers.where(value: [ 4, 5 ]).count
    (favorable.to_f / total * 100).round(2)
  end
end
