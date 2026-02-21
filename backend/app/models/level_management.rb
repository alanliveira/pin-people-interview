class LevelManagement < ApplicationRecord
  self.table_name = "company_roles"

  belongs_to :company
  has_many :employees, foreign_key: "level_management_id", dependent: :nullify

  enum :role_type, { management: "management" }

  validates :name, presence: true

  default_scope { where(role_type: "management") }

  before_create do
    self.role_type = "management"
  end
end
