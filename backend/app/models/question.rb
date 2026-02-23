class Question < ApplicationRecord
  belongs_to :search

  validates :description, presence: true
  validates :description, length: { maximum: 1_000 }

  enum :type, { linked: "linked", text: "text" }
end
