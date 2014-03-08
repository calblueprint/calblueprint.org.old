class Hackathon < ActiveRecord::Base
  belongs_to :semester
  has_many :hackathon_submissions

  def self.most_recent
    where(public: true).last
  end
end
