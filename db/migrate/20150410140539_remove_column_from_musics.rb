class RemoveColumnFromMusics < ActiveRecord::Migration
  def change
    remove_column :musics, :artist
  end
end
