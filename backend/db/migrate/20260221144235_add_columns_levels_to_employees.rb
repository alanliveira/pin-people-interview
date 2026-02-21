class AddColumnsLevelsToEmployees < ActiveRecord::Migration[8.1]
  def change
    add_reference :employees, :level_directorate, null: false, foreign_key: { to_table: :company_roles }
    add_reference :employees, :level_management, null: false, foreign_key: { to_table: :company_roles }
    add_reference :employees, :level_coordination, null: false, foreign_key: { to_table: :company_roles }
    add_reference :employees, :level_area, null: false, foreign_key: { to_table: :company_roles }
  end
end
