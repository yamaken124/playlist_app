class RemoveForeignKeyFromFavAndComment < ActiveRecord::Migration
  def up
    remove_foreign_key :favorites, :users
    remove_foreign_key :favorites, :playlists
    remove_foreign_key :comments, :users
    remove_foreign_key :comments, :playlists
  end

  def down
    add_foreign_key :favorites, :users, on_delete: :cascade
    add_foreign_key :favorites, :playlists, on_delete: :cascade
    add_foreign_key :comments, :users, on_delete: :cascade
    add_foreign_key :comments, :playlists, on_delete: :cascade
  end
end
