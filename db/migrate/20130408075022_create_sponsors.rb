class CreateSponsors < ActiveRecord::Migration
  def up
    create_table :sponsors do |t|
      t.string :type
      t.string :link
      t.attachment :image
    end
  end

  def down
    drop_table :sponsors
  end
end
