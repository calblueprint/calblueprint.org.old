# == Schema Information
#
# Table name: hack_photos
#
#  id                      :integer          not null, primary key
#  hackathon_submission_id :integer
#  created_at              :datetime
#  updated_at              :datetime
#  image_file_name         :string(255)
#  image_content_type      :string(255)
#  image_file_size         :integer
#  image_updated_at        :datetime
#

class HackPhoto < ActiveRecord::Base
  belongs_to :hackathon_submission
  has_attached_file :image,
    :storage => :s3,
    :s3_credentials => S3_CREDENTIALS,
    :path => "/hackathon_submission_photos/:style/:id/:filename",
    :styles => { :medium => "400px>" }

  validates_attachment :image, :presence => true,
    :content_type => { :content_type => ["image/jpeg", "image/png"] },
    :size => { :in => 0..5.megabytes }
end
