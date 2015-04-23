class ChangeForeignKeyOfComments < ActiveRecord::Migration
  def change
    add_foreign_key :comments, :users, on_delete: :cascade
    add_foreign_key :comments, :playlists, on_delete: :cascade
  end
end
