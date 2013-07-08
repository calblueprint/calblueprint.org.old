class Sponsor < ActiveRecord::Base
  attr_accessible :sponsorship_type, :sponsor_link, :image

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