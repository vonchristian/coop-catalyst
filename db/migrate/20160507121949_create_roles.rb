class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
      t.string :role
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
