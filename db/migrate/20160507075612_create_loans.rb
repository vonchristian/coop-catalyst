class CreateLoans < ActiveRecord::Migration[5.0]
  def change
    create_table :loans do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :loan_product, foreign_key: true
      t.decimal :amount
      t.datetime :date
      t.integer :approval_status, default: 0

      t.timestamps
    end
  end
end
