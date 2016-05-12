class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string :customer_type
      t.string :name
      t.string :address
      t.string :mobile_number
      t.string :email
      t.integer :payment_type

      t.timestamps
    end
    add_index :orders, :customer_id
    add_index :orders, :customer_type
  end
end
