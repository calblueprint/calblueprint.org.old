class AddFieldsToApplications < ActiveRecord::Migration
  def up
  	add_column :applications, :rails_exp, :text
  	add_column :applications, :mobile_exp, :text
  end
end