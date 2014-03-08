class Student < ActiveRecord::Base
  has_and_belongs_to_many :hackathon_submissions

  validates :email, uniqueness: true
end
