class RemoveIsAlumniFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :is_alumni
  end
end
