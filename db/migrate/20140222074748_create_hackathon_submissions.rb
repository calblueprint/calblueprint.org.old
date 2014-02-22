class CreateHackathonSubmissions < ActiveRecord::Migration
  def change
    create_table :hackathon_submissions do |t|
      t.string :title
      t.text :description
      t.references :hackathon
      t.string :demo
      t.string :github
      t.string :video_link

      t.timestamps
    end
  end
end
