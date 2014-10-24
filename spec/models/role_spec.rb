# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  position_id :integer
#  semester_id :integer
#  name        :string(255)
#  user_type   :string(255)
#

require 'spec_helper'

describe Role do
  pending "add some examples to (or delete) #{__FILE__}"
end
