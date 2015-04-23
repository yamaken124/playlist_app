class AddGenderOfColumnToUser < ActiveRecord::Migration
  def up
    add_column :users, :gender, :integer, null: false
  end

  def down
    remove_column :users, :gender, :integer, null: false
  end
end
