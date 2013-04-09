class CreateMessages < ActiveRecord::Migration
  def up
    create_table :messages do |t|
      t.string :name
      t.string :email
      t.string :subject
      t.string :inquiry_type
      t.text :message

      t.timestamps
    end
  end

  def down
    drop_table :messages
  end
end
