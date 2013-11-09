class AddSemesterIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :semester_id, :integer
  end
end
