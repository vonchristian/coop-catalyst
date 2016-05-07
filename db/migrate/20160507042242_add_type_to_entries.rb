class AddTypeToEntries < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :type, :string
  end
end
