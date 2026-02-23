class QuestionAnswer < ApplicationRecord
  belongs_to :search
  belongs_to :employee

  validates :search, :employee, presence: true

  def complete?
    completed_at.present?
  end
end
