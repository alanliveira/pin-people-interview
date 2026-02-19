class CreateSurveys < ActiveRecord::Migration[8.1]
  def change
    create_table :surveys do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
