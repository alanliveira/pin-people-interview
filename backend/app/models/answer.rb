class Answer < ApplicationRecord
  belongs_to :question

  validates :value, :question, presence: true
end
