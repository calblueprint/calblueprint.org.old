class AddDecisionToEvaluations < ActiveRecord::Migration
  def change
    add_column :evaluations, :decision, :string
    remove_column :evaluations, :yes
    remove_column :evaluations, :no
    remove_column :evaluations, :maybe
  end
end
