class RemoveColumnFromAdmin < ActiveRecord::Migration
  def change
    remove_column :admins, :fav_music_genre
  end
end
