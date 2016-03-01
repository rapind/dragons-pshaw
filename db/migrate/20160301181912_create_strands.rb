class CreateStrands < ActiveRecord::Migration
  def change
    create_table :strands do |t|
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
