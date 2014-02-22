class AddPartialToHackathon < ActiveRecord::Migration
  def change
    add_column :hackathons, :partial, :string
  end
end
