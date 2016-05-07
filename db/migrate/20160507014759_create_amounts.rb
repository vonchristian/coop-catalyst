class CreateAmounts < ActiveRecord::Migration[5.0]
  def change
    create_table :amounts do |t|
      t.string :type
      t.references :account
      t.references :entry
      t.decimal :amount, precision: 10, scale: 2

      t.timestamps
    end
    add_index :amounts, :type
    add_index :amounts, [:account_id, :entry_id]
    add_index :amounts, [:entry_id, :account_id]
  end
end
