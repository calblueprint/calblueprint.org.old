# == Schema Information
#
# Table name: sponsors
#
#  id                 :integer          not null, primary key
#  sponsorship_type   :string(255)
#  sponsor_link       :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Sponsor < ActiveRecord::Base
  validates :sponsorship_type, :sponsor_link, :presence => true
  validates_attachment :image, :presence => true,
    :content_type => { :content_type => ["image/jpeg", "image/png"] },
    :size => { :in => 0..5.megabytes }

  has_attached_file :image,
    :storage => :s3,
    :s3_credentials => S3_CREDENTIALS,
    :path => "/sponsors/:style/:id/:filename",
    :styles => { :medium => "400px>" }
end
