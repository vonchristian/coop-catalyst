class CreateShareCapitals < ActiveRecord::Migration[5.0]
  def change
    create_table :share_capitals do |t|
      t.belongs_to :user, foreign_key: true
      t.string :account_number
      t.datetime :date_opened

      t.timestamps
    end
  end
end
