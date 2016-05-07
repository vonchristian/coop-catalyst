class CreateInterestRates < ActiveRecord::Migration[5.0]
  def change
    create_table :interest_rates do |t|
      t.belongs_to :loan_product, index: true, foreign_key: true
      t.decimal :rate, precision: 3, scale: 2
      t.integer :recurrence

      t.timestamps
    end
  end
end
