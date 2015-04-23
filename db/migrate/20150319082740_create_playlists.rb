class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.references :user, index: true
      t.string :title
      t.string :comment
      t.integer :genre
      t.boolean :fav

      t.timestamps null: false
    end
    add_foreign_key :playlists, :users
  end
end
