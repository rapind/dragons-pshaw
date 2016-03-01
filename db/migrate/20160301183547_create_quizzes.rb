class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :name, null: false
      t.integer :number_of_questions, null: false

      t.timestamps null: false
    end
  end
end
