class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
    	t.string :firstname
    	t.string :lastname
    	t.string :email
    	t.string :phone
    	t.string :year
    	t.string :major
    	t.string :gpa
    	t.string :cs_gpa
    	t.text :why_join
    	t.text :work_sample
    	t.string :development_type
    	t.text :coursework
    	t.text :commitments
        t.text :rails_exp
        t.text :mobile_exp
    	t.string :cc_availability
    	t.string :retreat_availability
    	t.string :meeting_availability
    	t.string :dinner_availability
    	t.string :commitment_availability
    	t.string :referral
    	t.attachment :resume
      t.timestamps
    end
  end
end