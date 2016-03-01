class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :standard, index: true, foreign_key: true
      t.string :label, null: false
      t.float :difficulty, null: false

      t.timestamps null: false
    end
  end
end
