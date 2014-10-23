# == Schema Information
#
# Table name: hackathons
#
#  id                :integer          not null, primary key
#  semester_id       :integer
#  name              :string(255)
#  registration_link :string(255)
#  starts            :datetime
#  ends              :datetime
#  location          :string(255)
#  description       :text
#  created_at        :datetime
#  updated_at        :datetime
#  partial           :string(255)
#  url               :string(255)
#  public            :boolean          default(FALSE)
#

class Hackathon < ActiveRecord::Base
  belongs_to :semester
  has_many :hackathon_submissions

  def self.most_recent
    where(public: true).last
  end
end
