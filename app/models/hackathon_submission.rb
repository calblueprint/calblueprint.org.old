class HackathonSubmission < ActiveRecord::Base
  belongs_to :hackathon
  has_and_belongs_to_many :students

  acts_as_taggable_on :tags
end
