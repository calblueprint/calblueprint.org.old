class Student < ActiveRecord::Base
  has_and_belongs_to_many :hackathon_submissions
end
