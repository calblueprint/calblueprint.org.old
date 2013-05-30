class ChangeDefaultsForUsers < ActiveRecord::Migration
  def change
    change_column :users, :is_approved, :boolean, :default => false, :null => false
    change_column :users, :name, :string, :default => "Steve", :null => false
    change_column :users, :position, :string, :null => false
    change_column :users, :is_alumni, :boolean, :default => false, :null => false
    change_column :users, :is_admin, :boolean, :default => :false, :null => false
  end
end
