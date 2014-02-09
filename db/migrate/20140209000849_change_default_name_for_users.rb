class ChangeDefaultNameForUsers < ActiveRecord::Migration
  def change
    change_column :users, :name, :string, :default => "", :null => false
  end
end
