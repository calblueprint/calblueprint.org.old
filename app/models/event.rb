class Event < ActiveRecord::Base
	attr_accessible :name, :description, :creator, :location, :date, :time
  # attr_accessible :title, :body
end
