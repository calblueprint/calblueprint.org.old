class Application < ActiveRecord::Base
	attr_accessible :firstname, :lastname, :resume, :email, :phone, :year, :major, :gpa, :why_join, :development_type, :back_end, :graphic_design, :front_end, :work_sample, :coursework, :rails_exp, :mobile_exp, :commitments, :cc_availability, :retreat_availability, :meeting_availability, :dinner_availability, :commitment_availability, :referral, :semester

	validates :firstname, :lastname, :email, :phone, :year, :major, :gpa, :presence => true
	validates :why_join, :work_sample, :coursework, :commitments, :cc_availability, :retreat_availability, :meeting_availability, :dinner_availability, :commitment_availability, :presence => true
	validates_attachment :resume, :presence => true,
		:content_type => { :content_type => "application/pdf" },
		:size => { :in => 0..1.megabytes }

  belongs_to :semester

	has_attached_file :resume,
    :storage => :s3,
    :s3_credentials => S3_CREDENTIALS,
    :path => "/resumes/:id/:filename"

  scope :semester, lambda { |sem| joins(:semester).where("semesters.id = ?", sem.id)}
end