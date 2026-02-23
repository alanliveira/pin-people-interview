class RenameTypeInQuestions < ActiveRecord::Migration[8.1]
  def change
    rename_column :questions, :type, :question_type
  end
end
