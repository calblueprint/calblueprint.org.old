class AddPublicToHackathon < ActiveRecord::Migration
  def change
    add_column :hackathons, :public, :boolean, default: false
  end
end
