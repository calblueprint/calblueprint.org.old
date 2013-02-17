class Event < ActiveRecord::Base
	attr_accessible :name, :description, :creator, :location, :date, :time, :startTime, :endTime
  # attr_accessible :title, :body
end
