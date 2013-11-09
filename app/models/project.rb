class Project < ActiveRecord::Base
  attr_accessible :client, :title, :description, :link, :image, :semester

  validates :client, :title, :description, :presence => true
  validates_attachment :image, :presence => true,
    :content_type => { :content_type => ["image/jpeg", "image/png"] },
    :size => { :in => 0..5.megabytes }

  has_many :member

  belongs_to :semester

  has_attached_file :image,
    :storage => :s3,
    :s3_credentials => S3_CREDENTIALS,
    :path => "/projects/:style/:id/:filename",
    :styles => { :medium => "400px>" }

  scope :semester, lambda { |sem| joins(:semester).where("semesters.id = ?", sem.id)}
end