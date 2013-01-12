class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :position_type, :string
    add_column :users, :position, :string
    add_column :users, :year, :string
    add_column :users, :major, :string
    add_column :users, :project, :string
    add_column :users, :experience, :text
    add_column :users, :about, :text
    add_column :users, :image, :string
    add_column :users, :admin, :boolean
  end
end
