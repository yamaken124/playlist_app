class AddCountFavColumnToPlaylists < ActiveRecord::Migration
  def up
    add_column :playlists, :count_fav, :integer, default: 0
  end

  def down
    remove_column :playlists, :count_fav, :integer
  end
end
