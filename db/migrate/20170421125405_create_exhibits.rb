class CreateExhibits < ActiveRecord::Migration
  def change
    create_table :exhibits do |t|
      t.text :e_name, null: false
      t.text :description_e, null: false
      t.integer :i_value, null: false
      t.integer :age, null: false
      t.string :size, null: false
      t.text :condition, null: false
      t.references :collection, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
