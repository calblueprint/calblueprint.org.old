class CreateMembers < ActiveRecord::Migration
  def change
	  create_table :members do |t|
      t.string :name
      t.string :email
      t.string :rank
      t.string :position
      t.integer :year
      t.string :major
      t.string :site
      t.text :projects
      t.text :experience
      t.text :expertise
      t.boolean :current_member
    end
  end
end