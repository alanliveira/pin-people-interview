class CreateCompanyRoles < ActiveRecord::Migration[8.1]
  def change
    create_table :company_roles do |t|
      t.string :name
      t.string :role_type

      t.timestamps
    end
  end
end
