# == Schema Information
#
# Table name: evaluations
#
#  id             :integer          not null, primary key
#  user_id        :integer
#  application_id :integer
#  comment        :text
#  created_at     :datetime
#  updated_at     :datetime
#  decision       :string(255)
#

class Evaluation < ActiveRecord::Base
  belongs_to :user
  belongs_to :application

  validates :decision, presence: true
end
