class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :question_answer

  validates :value, :question, presence: true
end
