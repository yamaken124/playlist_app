class AddForeignKeyToComments < ActiveRecord::Migration
  def change
    add_foreign_key :comments, :playlists, on_delete: :cascade
  end
end
