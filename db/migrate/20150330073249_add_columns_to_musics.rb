class AddColumnsToMusics < ActiveRecord::Migration
  def change
    add_column :musics, :title, :string
    add_column :musics, :artist, :string
  end
end
