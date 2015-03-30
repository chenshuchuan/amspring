class UserMailer < ActionMailer::Base
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
  end
end
