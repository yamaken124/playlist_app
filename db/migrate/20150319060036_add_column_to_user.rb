class AddColumnToUser < ActiveRecord::Migration
  def up
    add_column :users, :name, :string, null: false
    add_column :users, :birth_date, :date, null: false
    add_column :users, :bd_open, :integer, default: 0
    add_column :users, :fav_music_genre, :integer
    add_column :users, :comment, :text
  end

  def down
    remove_column :users, :name, :string, null: false
    remove_column :users, :birth_date, :date, null: false
    remove_column :users, :bd_open, :integer, default: 0
    remove_column :users, :fav_music_genre, :integer
    remove_column :users, :comment, :text
  end

end
