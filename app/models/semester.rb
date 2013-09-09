class Semester < ActiveRecord::Base
  attr_accessible :current, :semester, :year
  has_many :applications

  def self.current
    Semester.find_by_current(true)
  end
end
