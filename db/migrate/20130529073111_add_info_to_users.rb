class AddInfoToUsers < ActiveRecord::Migration
  def up
    add_column :users, :name, :string
    add_column :users, :position, :string
    add_column :users, :year, :string
    add_column :users, :major, :string
    add_column :users, :site, :string
    add_column :users, :is_alumni, :boolean, :default => :false
    
    add_column :users, :is_admin, :boolean, :default => false
    
    rename_column :users, :approved, :is_approved
  end

  def down
    remove_column :users, :name
    remove_column :users, :position
    remove_column :users, :year
    remove_column :users, :major
    remove_column :users, :site
    remove_column :users, :is_alumni
    
    remove_column :users, :is_admin
    
    rename_column :users, :is_approved, :approved
  end
end
