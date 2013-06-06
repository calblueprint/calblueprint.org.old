class AddFacebookToUsers < ActiveRecord::Migration
  def up
    add_column :users, :facebook_id, :string
  end
  
  def down
    remove_column :users, :facebook_id
  end
end
