class Company < ApplicationRecord
  has_many :company_positions, dependent: :destroy
  has_many :company_departments, dependent: :destroy
  has_many :company_functions, dependent: :destroy
  has_many :employees, dependent: :destroy
end
