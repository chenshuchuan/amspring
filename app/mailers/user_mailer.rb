class UserMailer < ActionMailer::Base
  #default from: current_user.email
  default from: "shuchuan_chen@126.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => I18n.t("reset_password")
  end

  def send_boxs(user, topic, body)
    @user = user
    @body = body
    mail :to => user.email, :subject => topic
    #mail(to: @user.email,
    #     subject: topic) do |format|
    #  format.html { render 'send_boxs' }
    #  format.text { render text: 'send_boxs' }
    #end
  end
end
