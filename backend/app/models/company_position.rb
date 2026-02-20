class CompanyPosition < ApplicationRecord
  self.table_name = "company_roles"

  belongs_to :company
  has_many :employees, foreign_key: 'company_position_id', dependent: :nullify

  enum :role_type, { position: 'position' }
  
  default_scope { where(role_type: "position") }

  before_create do
    self.role_type = "position"
  end
end
