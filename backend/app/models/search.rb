class Search < ApplicationRecord
  belongs_to :company

  has_many :questions, dependent: :destroy
  has_many :question_answers, dependent: :destroy

  validates :title, presence: true
  validates :title, length: { maximum: 255 }

  def conversion_rate
    invited = company.employees.count
    responded = question_answers.where.not(completed_at: nil).count
    (responded.to_f / invited * 100).round(2)
  end
end
