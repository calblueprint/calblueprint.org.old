class CreateMembers < ActiveRecord::Migration
  def change
	  create_table :members do |t|
      t.string :name
      t.string :email
      t.string :position
      t.string :year
      t.string :major
      t.string :projects
      t.string :experience
      t.string :expertise
    end
  end
end