class Semester < ActiveRecord::Base
  has_many :applications
  has_many :projects
  has_many :roles
  has_many :users, through: :roles
  has_many :hackathons

  default_scope { order('created_at DESC') }

  validates_uniqueness_of :semester, scope: :year

  def self.current
    Semester.find_by_current(true)
  end

  def self.choices
    Semester.all.collect {|sem| [ sem.semester + " " + sem.year, sem.id ] }
  end

  def full_name
    "#{semester} #{year}"
  end

  def name
    "#{semester}_#{year}".downcase
  end
end
