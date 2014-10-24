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

require 'spec_helper'

describe Evaluation do
  pending "add some examples to (or delete) #{__FILE__}"
end
