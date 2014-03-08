class CreateHackathons < ActiveRecord::Migration
  def change
    create_table :hackathons do |t|
      t.references :semester
      t.string :name
      t.string :registration_link
      t.datetime :starts
      t.datetime :ends
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
