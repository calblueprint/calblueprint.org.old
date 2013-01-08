class RenameInquiriesToMessages < ActiveRecord::Migration
  def change
    rename_table :inquiries, :messages
  end
end
