class AddHiddenToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :hidden, :boolean, default: false
  end
end
