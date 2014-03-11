class AddAwardToHackathonSubmission < ActiveRecord::Migration
  def change
    add_column :hackathon_submissions, :award, :string
  end
end
