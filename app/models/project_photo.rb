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
