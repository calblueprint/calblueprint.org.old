class CreateHackPhotos < ActiveRecord::Migration
  def change
    create_table :hack_photos do |t|
      t.references :hackathon_submission

      t.timestamps
    end
  end
end
