class RemoveForeignKeyFromComments < ActiveRecord::Migration
  def change
    remove_foreign_key :comments, :playlists
  end
end
