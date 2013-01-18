class AddFieldsToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :email, :string
    add_column :applications, :phone, :string
    add_column :applications, :year, :string
    add_column :applications, :major, :string
    add_column :applications, :gpa, :string
    add_column :applications, :cs_gpa, :string
    add_column :applications, :why_join, :text
    add_column :applications, :work_sample, :text
    add_column :applications, :development_type, :string
    add_column :applications, :coursework, :text
    add_column :applications, :commitments, :text
    add_column :applications, :cc_availability, :string
    add_column :applications, :retreat_availability, :string
    add_column :applications, :meeting_availability, :string
    add_column :applications, :referral, :string
  end
end
