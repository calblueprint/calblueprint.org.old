class MakeTitlesUniqueForHackathonSubmissions < ActiveRecord::Migration
  def change
    change_column :hackathon_submissions, :title, :string, unique: true
  end
end
