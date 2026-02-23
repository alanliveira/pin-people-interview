class CreateSearches < ActiveRecord::Migration[8.1]
  def change
    create_table :searches do |t|
      t.references :company, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
