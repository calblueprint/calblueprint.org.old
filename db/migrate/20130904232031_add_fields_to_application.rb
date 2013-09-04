class AddFieldsToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :front_end, :string
    add_column :applications, :back_end, :string
    add_column :applications, :graphic_design, :string
  end
end
