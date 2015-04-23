class AddForeignKeyToFavorites < ActiveRecord::Migration
  def change
    add_foreign_key :favorites, :users, on_delete: :cascade
    add_foreign_key :favorites, :playlists, on_delete: :cascade
  end
end
