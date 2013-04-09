class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
    	t.string :name
    	t.text :description
    	t.string :creator
    	t.string :location
    	t.date :date
    	t.time :time

    	t.timestamps
    end
  end

  def down
    drop_table :events
  end
end
