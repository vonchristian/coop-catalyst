class CreateLoanProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :loan_products do |t|
      t.string :name
      t.decimal :term
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
