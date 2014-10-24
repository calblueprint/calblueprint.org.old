# == Schema Information
#
# Table name: applications
#
#  id                      :integer          not null, primary key
#  firstname               :string(255)
#  lastname                :string(255)
#  email                   :string(255)
#  phone                   :string(255)
#  year                    :string(255)
#  major                   :string(255)
#  gpa                     :string(255)
#  cs_gpa                  :string(255)
#  why_join                :text
#  work_sample             :text
#  development_type        :string(255)
#  coursework              :text
#  commitments             :text
#  rails_exp               :text
#  mobile_exp              :text
#  cc_availability         :string(255)
#  retreat_availability    :string(255)
#  meeting_availability    :string(255)
#  dinner_availability     :string(255)
#  commitment_availability :string(255)
#  referral                :string(255)
#  resume_file_name        :string(255)
#  resume_content_type     :string(255)
#  resume_file_size        :integer
#  resume_updated_at       :datetime
#  created_at              :datetime
#  updated_at              :datetime
#  front_end               :string(255)
#  back_end                :string(255)
#  graphic_design          :string(255)
#  semester_id             :integer
#  hidden                  :boolean          default(FALSE)
#

class Application < ActiveRecord::Base
  validates :firstname, :lastname, :email, :phone, :year, :major, :gpa, :presence => true
  validates :why_join, :work_sample, :coursework, :commitments, :cc_availability, :retreat_availability, :meeting_availability, :dinner_availability, :commitment_availability, :presence => true
  validates_attachment :resume, :presence => true,
    :content_type => { :content_type => "application/pdf" },
    :size => { :in => 0..1.megabytes }

  belongs_to :semester
  has_many :evaluations, dependent: :destroy

  has_attached_file :resume,
    :storage => :s3,
    :s3_credentials => S3_CREDENTIALS,
    :path => "/resumes/:id/:filename"

  scope :semester, lambda { |sem| joins(:semester).where("semesters.id = ?", sem.id)}
  scope :not_hidden, where(hidden: false)

  def full_name
    "#{firstname} #{lastname}"
  end

  def next
    # Returns nil if it cannot find the next application.
    Application.find_by_id(id + 1)
  end

  def evaluations_by_users(users)
    sorted_evaluations = []
    users.each do |user|
      evaluation = evaluations.find_by_user_id(user.id)
      sorted_evaluations.push(evaluation)
    end
    sorted_evaluations
  end

  # Evaluation totals
  def total(decision)
    evaluations.where(decision: decision).count
  end

  def total_yes
    total('yes')
  end

  def total_maybe
    total('maybe')
  end

  def total_no
    total('no')
  end

end
