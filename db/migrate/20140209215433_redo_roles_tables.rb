class RedoRolesTables < ActiveRecord::Migration
  def change
    drop_table :roles
    drop_table :users_roles

    create_table(:positions) do |t|
      t.string :name
      t.string :user_type

      t.timestamps
    end

    create_table(:roles) do |t|
      t.references :user
      t.references :position
      t.references :semester
      t.string :name
      t.string :user_type
    end

    add_index(:positions, :name)
    add_index(:positions, :user_type)

    add_index(:roles, [:user_id, :semester_id])
    add_index(:roles, [:semester_id])
    add_index(:roles, :name)
    add_index(:roles, :user_type)
    add_index(:roles, [:user_type, :semester_id])
  end
end
