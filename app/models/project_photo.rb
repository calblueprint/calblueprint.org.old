# == Schema Information
#
# Table name: project_photos
#
#  id                 :integer          not null, primary key
#  project_id         :integer
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class ProjectPhoto < ActiveRecord::Base
  belongs_to :project
  has_attached_file :image,
    :storage => :s3,
    :s3_credentials => S3_CREDENTIALS,
    :path => "/project_photos/:style/:id/:filename",
    :styles => { :medium => "400px>" }

  validates_attachment :image, :presence => true,
    :content_type => { :content_type => ["image/jpeg", "image/png"] },
    :size => { :in => 0..5.megabytes }
end
