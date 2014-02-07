class RemovePositionAndIsAdminFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :is_admin
    remove_column :users, :position
  end
end
