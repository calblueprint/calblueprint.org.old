class AddWhySocialGoodAndDesignExpToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :why_social_good, :text
    add_column :applications, :design_exp, :text
  end
end
