class AddTypeToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :inquiry_type, :string
  end
end
