class AddUrlToHackathons < ActiveRecord::Migration
  def change
    add_column :hackathons, :url, :string
  end
end
