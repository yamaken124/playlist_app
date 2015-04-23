class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.references :playlist, index: true
      t.text :content

      t.timestamps null: false
    end
    add_foreign_key :comments, :users, on_delete: :cascade
    add_foreign_key :comments, :playlists, dependent: :destroy
  end
end
