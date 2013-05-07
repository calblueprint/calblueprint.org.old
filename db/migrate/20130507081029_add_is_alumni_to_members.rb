class AddIsAlumniToMembers < ActiveRecord::Migration
  def up
    add_column :members, :is_alumni, :boolean, :default => false
  end

  def down
    remove_column :members, :is_alumni
  end
end
