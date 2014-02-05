class CreateEvaluations < ActiveRecord::Migration
  def change
    create_table :evaluations do |t|
      t.references :user
      t.references :application

      t.boolean :yes, default: false
      t.boolean :no, default: false
      t.boolean :maybe, default: false

      t.text :comment

      t.timestamps
    end
  end
end
