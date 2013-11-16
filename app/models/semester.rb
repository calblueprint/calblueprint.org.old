class Semester < ActiveRecord::Base
  has_many :applications
  has_many :projects

  def self.current
    Semester.find_by_current(true)
  end

  def self.choices
    Semester.all.collect {|sem| [ sem.semester + " " + sem.year, sem.id ] }
  end
end
