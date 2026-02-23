class CreateQuestionAnswers < ActiveRecord::Migration[8.1]
  def change
    create_table :question_answers do |t|
      t.references :search, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.datetime :completed_at

      t.timestamps
    end
  end
end
