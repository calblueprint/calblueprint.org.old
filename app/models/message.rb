# == Schema Information
#
# Table name: messages
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  email        :string(255)
#  subject      :string(255)
#  inquiry_type :string(255)
#  message      :text
#  created_at   :datetime
#  updated_at   :datetime
#

class Message < ActiveRecord::Base
  validates :name, :email, :message, :inquiry_type, presence: true
end
