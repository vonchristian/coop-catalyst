class RemoveProfilePhotoIdFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :profile_photo_id, :string
  end
end
