class AddColumnCompanyToCompanyRoles < ActiveRecord::Migration[8.1]
  def change
    add_reference :company_roles, :company, null: false, foreign_key: true
  end
end
