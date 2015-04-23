class AddForeignKeyToFav < ActiveRecord::Migration
  def up
    add_foreign_key :favorites, :playlists, on_delete: :cascade
  end

  def down
    remove_foreign_key :favorites, :playlists
  end
end
