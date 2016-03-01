class CreateQuizQuestions < ActiveRecord::Migration
  def change
    create_table :quiz_questions do |t|
      t.references :quiz, index: true, foreign_key: true, null: false
      t.references :question, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
