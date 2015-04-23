class AddForeignKeyToPlaylists < ActiveRecord::Migration
  def change
    add_foreign_key :playlists, :users, on_delete: :cascade
  end
end
