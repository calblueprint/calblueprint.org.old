class Message < ActiveRecord::Base
  attr_accessible :email, :message, :name, :subject, :inquiry_type
  validates :name, :email, :message, :inquiry_type, presence: true
end
