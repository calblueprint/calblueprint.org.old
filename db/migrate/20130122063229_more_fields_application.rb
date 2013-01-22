class MoreFieldsApplication < ActiveRecord::Migration
  def up
    add_column :applications, :firstname, :string
    add_column :applications, :lastname, :string
    add_column :applications, :dinner_availability, :string
    add_column :applications, :commitment_availability, :string
    remove_column :applications, :name
  end

  def down
    remove_column :applications, :firstname
    remove_column :applications, :lastname
    remove_column :applications, :dinner_availability
    remove_column :applications, :commitment_availability, :string
    add_column :applications, :name, :string
  end
end
