class Application < ActiveRecord::Base
	attr_accessible :name, :resume
	validates :name, :presence => true
	validates_attachment :resume, :presence => true,
		:content_type => { :content_type => "application/pdf" },
		:size => { :in => 0..1.megabytes }

  has_attached_file :resume,
		:storage => :dropbox,
		:dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
		:dropbox_options => {
			:unique_filename => true
		}
end