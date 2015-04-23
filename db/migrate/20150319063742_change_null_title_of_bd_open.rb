class ChangeNullTitleOfBdOpen < ActiveRecord::Migration
  def change
    change_column_null :users, :bd_open, false
  end
end
