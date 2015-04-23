class RemoveCommentFromAdmins < ActiveRecord::Migration
  def up
    remove_column :admins, :comment
  end

  def down
    add_column :admins, :comment, :text
  end
end
