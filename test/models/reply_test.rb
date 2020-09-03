# == Schema Information
#
# Table name: replies
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment_id :bigint           not null
#  post_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_replies_on_comment_id  (comment_id)
#  index_replies_on_post_id     (post_id)
#  index_replies_on_user_id     (user_id)
#
require 'test_helper'

class ReplyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
