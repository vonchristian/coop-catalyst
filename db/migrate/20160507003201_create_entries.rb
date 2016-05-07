class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :reference_number
      t.datetime :date
      t.integer :entriable_id
      t.string :entriable_type
      t.string :description
      t.integer :recorder_id

      t.timestamps
    end
    add_index :entries, :entriable_id
    add_index :entries, :entriable_type
    add_index :entries, :recorder_id
  end
end
