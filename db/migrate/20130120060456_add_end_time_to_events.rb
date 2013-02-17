class AddEndTimeToEvents < ActiveRecord::Migration
  def change
  	remove_column :events, :creator, :string
  	add_column :events, :endTime, :time
  	add_column :events, :startTime, :time
  	change_column :events, :time, :datetime
  end
end
