# == Schema Information
#
# Table name: replies
#
#  id         :integer          not null, primary key
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
class Reply < ApplicationRecord
  has_rich_text :content

  belongs_to :user
  belongs_to :post
  belongs_to :comment

  after_create :send_email

  private
  def send_email
    # user = User.find(params[:id])
    # @user = user.repl
    # @user = user.display_name
    SendWhenMentionMailer.send_mention(user, reply).deliver_now
  end
end
