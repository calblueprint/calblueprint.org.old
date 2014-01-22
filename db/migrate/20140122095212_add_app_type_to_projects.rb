class AddAppTypeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :app_type, :string
  end
end
