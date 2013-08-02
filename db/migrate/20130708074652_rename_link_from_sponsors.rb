class RenameLinkFromSponsors < ActiveRecord::Migration
  def change
    rename_column :sponsors, :link, :sponsor_link
  end
end
