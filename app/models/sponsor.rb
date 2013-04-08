class Sponsor < ActiveRecord::Base
  attr_accessible :sponsorship_type, :link, :image

  validates :sponsorship_type, :link, :presence => true
  validates_attachment :image, :presence => true,
    :content_type => { :content_type => ["image/jpeg", "image/png"] },
    :size => { :in => 0..5.megabytes }

  has_attached_file :image,
    :storage => :dropbox,
    :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
    :dropbox_options => {
      :unique_filename => true
    }
end