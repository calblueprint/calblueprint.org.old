class AddImageToProjectPhotos < ActiveRecord::Migration
  def change
    add_attachment :project_photos, :image
  end
end
