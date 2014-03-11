class AddUrlToHackathonSubmissions < ActiveRecord::Migration
  def change
    add_column :hackathon_submissions, :url, :string
  end
end
