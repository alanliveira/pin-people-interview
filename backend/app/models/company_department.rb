class CompanyDepartment < ApplicationRecord
  self.table_name = "company_roles"

  belongs_to :company
  has_many :employees, foreign_key: "company_department_id", dependent: :nullify

  enum :role_type, { department: "department" }

  validates :name, presence: true

  default_scope { where(role_type: "department") }

  before_create do
    self.role_type = "department"
  end
end
