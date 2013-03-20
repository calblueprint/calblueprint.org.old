class Project < ActiveRecord::Base
  attr_accessible :client, :title, :description, :link, :image

  validates :client, :title, :description, :presence => true
  validates_attachment :image, :presence => false,
    :content_type => { :content_type => ["image/jpeg", "image/png"] },
    :size => { :in => 0..5.megabytes }

  has_attached_file :image,
    :storage => :dropbox,
    :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
    :dropbox_options => {
      :unique_filename => true
    }
end