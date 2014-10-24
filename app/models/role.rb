# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  position_id :integer
#  semester_id :integer
#  name        :string(255)
#  user_type   :string(255)
#

class Role < ActiveRecord::Base
  belongs_to :user
  belongs_to :position
  belongs_to :semester

  default_scope { order("semester_id DESC") }

  def self.remove_semester_roles(semester)
    Role.where(semester_id: semester.id).destroy_all
  end

end
