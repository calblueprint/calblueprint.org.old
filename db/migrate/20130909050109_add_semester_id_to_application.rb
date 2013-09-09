class AddSemesterIdToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :semester_id, :integer
  end
end
