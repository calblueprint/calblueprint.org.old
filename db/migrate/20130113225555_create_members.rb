class CreateMembers < ActiveRecord::Migration
  def change
	  create_table :members do |t|
      t.string :name
      t.string :position
      t.string :year
      t.string :major
      t.string :site
    end
  end
end