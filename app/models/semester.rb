class Semester < ActiveRecord::Base
  has_many :applications
  has_many :projects

  default_scope { order('created_at DESC') }

  def self.current
    Semester.find_by_current(true)
  end

  def self.choices
    Semester.all.collect {|sem| [ sem.semester + " " + sem.year, sem.id ] }
  end

  def full_name
    "#{semester} #{year}"
  end
end
