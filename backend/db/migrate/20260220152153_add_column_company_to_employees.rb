class AddColumnCompanyToEmployees < ActiveRecord::Migration[8.1]
  def change
    add_reference :employees, :company, null: false, foreign_key: true
  end
end
