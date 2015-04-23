class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.references :playlist, index: true
      t.string :url, null: false

      t.timestamps null: false
    end
    add_foreign_key :musics, :playlists, on_delete: :cascade
  end
end
