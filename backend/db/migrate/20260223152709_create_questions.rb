class CreateQuestions < ActiveRecord::Migration[8.1]
  def change
    create_table :questions do |t|
      t.references :search, null: false, foreign_key: true
      t.text :description
      t.string :type

      t.timestamps
    end
  end
end
