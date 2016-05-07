class CreateLoanFees < ActiveRecord::Migration[5.0]
  def change
    create_table :loan_fees do |t|
      t.decimal :rate
      t.string :name
      t.belongs_to :loan_product, index: true, foreign_key: true

      t.timestamps
    end
  end
end
