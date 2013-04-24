class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.string :site
      t.string :email
      t.text :description
      t.attachment :image
    end
  end
end
