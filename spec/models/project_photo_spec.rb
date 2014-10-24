# == Schema Information
#
# Table name: project_photos
#
#  id                 :integer          not null, primary key
#  project_id         :integer
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

require 'spec_helper'

describe ProjectPhoto do
  pending "add some examples to (or delete) #{__FILE__}"
end
