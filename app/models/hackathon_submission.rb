class HackathonSubmission < ActiveRecord::Base
  belongs_to :hackathon
  has_and_belongs_to_many :students
  has_many :hack_photos, dependent: :destroy

  acts_as_taggable_on :tags
  accepts_nested_attributes_for :students, allow_destroy: true
  accepts_nested_attributes_for :hack_photos
  validates_presence_of :title, :description, :demo
  validate :supplied_tags
  validate :has_at_least_one_hacker
  validate :hacker_has_name_and_email
  validate :has_screenshot

  def students_attributes=(hash)
    hash.each do |sequence, student_values|
      unless student_values[:_destroy] != "false"
        new_student = Student.find_or_create_by(email: student_values[:email])
        new_student.name = student_values[:name]
        students << new_student
      end
    end
  end

  def has_screenshot
    errors.add(:you, "must supply a screenshot!") if self.hack_photos.blank?
  end

  def has_at_least_one_hacker
    errors.add(:you, 'must add at least one hacker.') if self.students.blank?
  end

  def supplied_tags
    errors.add(:tag_list, "cannot be empty.") if self.tag_list.blank?
  end

  def hacker_has_name_and_email
    self.students.each do |student|
      errors.add(:each, 'hacker requires a name and valid email address.') if student.name.blank? || student.email.blank?
    end
  end

  def has_image?
    !hack_photos.empty?
  end

  def image
    hack_photos.first.image
  end

  def hacker_names
    names = []
    students.each do |hacker|
      names << hacker.name.titleize
    end
    names.to_sentence
  end

  def won_something?
    !award.nil?
  end

end
