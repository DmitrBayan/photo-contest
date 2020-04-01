# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  access_token :string           not null
#  first_name   :string
#  image_url    :string
#  last_name    :string
#  provider     :string           not null
#  uid          :string           not null
#  url          :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
