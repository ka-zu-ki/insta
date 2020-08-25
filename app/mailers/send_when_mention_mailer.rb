class SendwhenmentionMailer < ApplicationMailer
  def send_mention(user, reply)
    @user = user
    @reply = reply
    mail to: user.email, subject: '（アカウント名）さんからコメントに返信がありました'
  end
end