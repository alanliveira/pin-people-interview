class Search < ApplicationRecord
  belongs_to :company
  has_many :questions, dependent: :destroy

  validates :title, presence: true
  validates :title, length: { maximum: 255 }
end
