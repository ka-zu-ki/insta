# == Schema Information
#
# Table name: replies
#
#  id         :integer          not null, primary key
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  comment_id :integer          not null
#  post_id    :integer          not null
#  user_id    :integer          not null
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
