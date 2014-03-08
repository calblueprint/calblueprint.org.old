class HackathonSubmission < ActiveRecord::Base
  belongs_to :hackathon
  has_and_belongs_to_many :students

  acts_as_taggable_on :tags
  accepts_nested_attributes_for :students, allow_destroy: true
  validates_presence_of :title, :description, :tags

  def students_attributes=(hash)
    hash.each do |sequence, student_values|
      students <<  Student.find_or_create_by_email(student_values[:email])
    end
  end

end
