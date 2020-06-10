# frozen_string_literal: true

# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  body             :text
#  commentable_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  comment_id       :bigint
#  commentable_id   :integer
#  user_id          :bigint           not null
#
# Indexes
#
#  index_comments_on_comment_id  (comment_id)
#  index_comments_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (comment_id => comments.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
