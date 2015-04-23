class ChangeDefaultOfGenderOfAdmins < ActiveRecord::Migration
  def change
    change_column :admins, :gender, :integer, default: 0
  end
end
