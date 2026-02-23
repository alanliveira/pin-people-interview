class CompanyFunction < ApplicationRecord
  self.table_name = "company_roles"

  belongs_to :company
  has_many :employees, foreign_key: "company_function_id", dependent: :nullify

  enum :role_type, { function: "function" }

  validates :name, presence: true

  default_scope { where(role_type: "function") }

  before_create do
    self.role_type = "function"
  end
end
