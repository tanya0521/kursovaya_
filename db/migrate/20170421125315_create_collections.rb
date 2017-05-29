class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.text :c_name, null: false
      t.text :description, null: false
      t.date :date_begin, null: false
      t.date :date_end, null: false

      t.timestamps null: false
    end
  end
end
