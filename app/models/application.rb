class Application < ActiveRecord::Base
	attr_accessible :name, :resume, :email, :phone, :year, :major, :gpa, :cs_gpa, :why_join, :development_type, :cc_availability
	validates :name, :email, :phone, :year, :major, :gpa, :cs_gpa, :presence => true
	validates :why_join, :development_type, :presence => true
	#validates_attachment :resume, :presence => true,
	#	:content_type => { :content_type => "application/pdf" },
	#	:size => { :in => 0..1.megabytes }

  has_attached_file :resume,
		:storage => :dropbox,
		:dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
		:dropbox_options => {
			:unique_filename => true
		}
end