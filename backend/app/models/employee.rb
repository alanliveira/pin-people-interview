class Employee < ApplicationRecord
  belongs_to :company
  belongs_to :company_department
  belongs_to :company_function
  belongs_to :company_position
  belongs_to :level_area, class_name: "LevelArea"
  belongs_to :level_directorate, class_name: "LevelDirectorate"
  belongs_to :level_management, class_name: "LevelManagement"
  belongs_to :level_coordination, class_name: "LevelCoordination"
end
