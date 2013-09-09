class CreateSemesters < ActiveRecord::Migration
  def change
    create_table :semesters do |t|
      t.string :year
      t.string :semester
      t.boolean :current, :default => false

      t.timestamps
    end
  end
end
