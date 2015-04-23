class RemoveForeignerKeyFromPlaylists < ActiveRecord::Migration
  def change
    remove_foreign_key :playlists, :user
  end
end
