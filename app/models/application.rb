class Application < ActiveRecord::Base
	attr_accessible :firstname, :lastname, :resume, :email, :phone, :year, :major, :gpa, :why_join, :development_type, :work_sample, :coursework, :rails_exp, :mobile_exp, :commitments, :cc_availability, :retreat_availability, :meeting_availability, :dinner_availability, :commitment_availability, :referral
	validates :firstname, :lastname, :email, :phone, :year, :major, :gpa, :presence => true
	validates :why_join, :work_sample, :development_type, :coursework, :commitments, :cc_availability, :retreat_availability, :meeting_availability, :dinner_availability, :commitment_availability, :presence => true
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