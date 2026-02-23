class AddQuestionAnswerToAnswers < ActiveRecord::Migration[8.1]
  def change
    add_reference :answers, :question_answer, null: false, foreign_key: true
  end
end
