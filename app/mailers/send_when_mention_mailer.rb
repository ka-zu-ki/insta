class SendWhenMentionMailer < ApplicationMailer
  def send_mention(user, reply)
    @user = user
    @comment = comment
    mail to: user.email, subject: 'コメントに返信がありました'
  end
end