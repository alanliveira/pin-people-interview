class CreateEmployees < ActiveRecord::Migration[8.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.string :corporate_email
      t.string :phone_number
      t.references :company_department, null: false, foreign_key: { to_table: :company_roles }
      t.references :company_position, null: false, foreign_key: { to_table: :company_roles }
      t.references :company_function, null: false, foreign_key: { to_table: :company_roles }
      t.string :location
      t.string :company_tenure
      t.string :gender
      t.string :generation

      t.timestamps
    end
  end
end
