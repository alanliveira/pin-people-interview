class QuestionAnswer < ApplicationRecord
  belongs_to :search
  belongs_to :employee

  has_many :answers

  validates :search, :employee, presence: true

  def complete?
    completed_at.present?
  end
end
