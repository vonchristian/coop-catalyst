class CreateOccupations < ActiveRecord::Migration[5.0]
  def change
    create_table :occupations do |t|
      t.string :position
      t.string :employer
      t.string :employer_address
      t.string :contact_number
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
