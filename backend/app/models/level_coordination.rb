class LevelCoordination < ApplicationRecord
  self.table_name = "company_roles"

  belongs_to :company
  has_many :employees, foreign_key: "level_directorate_id", dependent: :nullify

  enum :role_type, { coordination: "coordination" }

  validates :name, presence: true

  default_scope { where(role_type: "coordination") }

  before_create do
    self.role_type = "coordination"
  end
end
