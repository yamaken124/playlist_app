class RemoveForeignKeyFromFav < ActiveRecord::Migration
  def up
    remove_foreign_key :favorites, :playlists
  end

  def down
    add_foreign_key :favorites, :playslits, on_delete: :cascade
  end
end
