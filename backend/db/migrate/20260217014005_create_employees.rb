class CreateEmployees < ActiveRecord::Migration[8.1]
  def change
    create_table :employees do |t|
      t.references :company, null: false, foreign_key: true
      t.references :departament, null: false, foreign_key: { to_table: :company_roles }
      t.references :position, null: false, foreign_key: { to_table: :company_roles }
      t.references :function, null: false, foreign_key: { to_table: :company_roles }
      t.references :company_level_0, null: false, foreign_key: { to_table: :company_roles }
      t.references :directorate_level_1, null: false, foreign_key: { to_table: :company_roles }
      t.references :management_level_2, null: false, foreign_key: { to_table: :company_roles }
      t.references :coordination_level_3, null: false, foreign_key: { to_table: :company_roles }
      t.references :area_level_4, null: false, foreign_key: { to_table: :company_roles }

      t.string :name
      t.string :email
      t.string :corporate_email
      t.string :phone_number
      t.string :company_tenure
      t.string :location
      t.string :genedr
      t.string :geration
    end
  end
end
