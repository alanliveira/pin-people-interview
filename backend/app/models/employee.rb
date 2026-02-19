class Employee < ApplicationRecord
  belongs_to :company
  belongs_to :departament
  belongs_to :position
  belongs_to :function
end
