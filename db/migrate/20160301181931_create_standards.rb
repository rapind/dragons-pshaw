class CreateStandards < ActiveRecord::Migration
  def change
    create_table :standards do |t|
      t.references :strand, index: true, foreign_key: true
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
