class CreateApprovals < ActiveRecord::Migration[5.0]
  def change
    create_table :approvals do |t|
      t.belongs_to :loan, foreign_key: true
      t.integer :approver_id
      t.datetime :date

      t.timestamps
    end
    add_index :approvals, :approver_id
  end
end
