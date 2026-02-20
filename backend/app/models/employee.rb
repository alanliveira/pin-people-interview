class Employee < ApplicationRecord
  belongs_to :company
  belongs_to :company_department
  belongs_to :company_function
  belongs_to :company_position
  
end
