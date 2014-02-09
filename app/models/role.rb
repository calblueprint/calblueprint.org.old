class Role < ActiveRecord::Base
  has_and_belongs_to_many :users, :join_table => :users_roles
  belongs_to :resource, :polymorphic => true
  scopify

  default_scope { order("resource_id DESC") }

  def self.remove_semester_roles(semester)
    Role.where(resource_id: semester.id).destroy_all
  end
end
