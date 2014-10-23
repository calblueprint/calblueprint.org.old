# == Schema Information
#
# Table name: hackathon_submissions
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  description  :text
#  hackathon_id :integer
#  demo         :string(255)
#  github       :string(255)
#  video_link   :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  url          :string(255)
#  award        :string(255)
#

require 'spec_helper'

describe HackathonSubmission do
  pending "add some examples to (or delete) #{__FILE__}"
end
