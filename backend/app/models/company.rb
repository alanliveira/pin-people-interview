class Company < ApplicationRecord
  has_many :positions,
           class_name: "CompanyPosition",
           foreign_key: "company_id",
           dependent: :destroy
  has_many :departments,
           class_name: "CompanyDepartment",
           foreign_key: "company_id",
           dependent: :destroy
  has_many :functions,
           class_name: "CompanyFunction",
           foreign_key: "company_id",
           dependent: :destroy
  has_many :employees,
           dependent: :destroy

  validates :name, presence: true
end
