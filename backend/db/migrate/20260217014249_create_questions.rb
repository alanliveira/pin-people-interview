class CreateQuestions < ActiveRecord::Migration[8.1]
  def change
    create_table :questions do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
