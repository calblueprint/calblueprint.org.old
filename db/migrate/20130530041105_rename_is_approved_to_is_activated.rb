class RenameIsApprovedToIsActivated < ActiveRecord::Migration
  def up
    rename_column :users, :is_approved, :is_activated
  end

  def down
    rename_column :users, :is_activated, :is_approved
  end
end
