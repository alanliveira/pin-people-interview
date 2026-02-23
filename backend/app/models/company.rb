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

  has_many :directorates,
            class_name: "LevelDirectorate",
            foreign_key: "company_id",
            dependent: :destroy

  has_many :managements,
            class_name: "LevelManagement",
            foreign_key: "company_id",
            dependent: :destroy

  has_many :coordinations,
            class_name: "LevelCoordination",
            foreign_key: "company_id",
            dependent: :destroy

  has_many :areas,
            class_name: "LevelArea",
            foreign_key: "company_id",
            dependent: :destroy

  validates :name, presence: true
end
