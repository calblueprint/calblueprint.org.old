class Message < ActiveRecord::Base
  validates :name, :email, :message, :inquiry_type, presence: true
end
