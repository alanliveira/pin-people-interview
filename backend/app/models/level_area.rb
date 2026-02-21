class LevelArea < ApplicationRecord
  self.table_name = "company_roles"

  belongs_to :company
  has_many :employees, foreign_key: "level_area_id", dependent: :nullify

  enum :role_type, { area: "area" }

  validates :name, presence: true

  default_scope { where(role_type: "area") }

  before_create do
    self.role_type = "area"
  end
end
