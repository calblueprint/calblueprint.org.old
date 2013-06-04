class AddIsVisibleToUsers < ActiveRecord::Migration
  def up
    add_column :users, :is_visible, :boolean, :default => false, :null => false
  end
  
  def down
    remove_column :users, :is_visible
  end
end
