class AddColumnTimeInCompanyToEmployees < ActiveRecord::Migration[8.1]
  def change
    add_column :employees, :time_in_company, :string
  end
end
