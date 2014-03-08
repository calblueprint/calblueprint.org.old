class CreateHackathonSubmissionsStudents < ActiveRecord::Migration
  def change
    create_table :hackathon_submissions_students do |t|
      t.references :hackathon_submission
      t.references :student
    end
  end
end
