# == Schema Information
#
# Table name: projects
#
#  id                 :integer          not null, primary key
#  client             :string(255)
#  title              :string(255)
#  description        :text
#  link               :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  semester_id        :integer
#  app_type           :string(255)
#

class Project < ActiveRecord::Base
  validates :client, :title, :description, :presence => true
  has_attached_file :image,
    :storage => :s3,
    :s3_credentials => S3_CREDENTIALS,
    :path => "/projects/:style/:id/:filename",
    :styles => { :medium => "400px>" }

  validates_attachment :image, :presence => true,
    :content_type => { :content_type => ["image/jpeg", "image/png"] },
    :size => { :in => 0..5.megabytes }

  has_many :project_photos, dependent: :destroy
  has_many :member

  belongs_to :semester

  accepts_nested_attributes_for :project_photos

  scope :semester, lambda { |sem| joins(:semester).where("semesters.id = ?", sem.id)}
end
