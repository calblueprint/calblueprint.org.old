class AddImageInfoToHackPhotos < ActiveRecord::Migration
  def change
    add_attachment :hack_photos, :image
  end
end
