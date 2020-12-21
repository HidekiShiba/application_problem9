class ThanksMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.thanks_mailer.thanks_mail.subject
  #
  default from: 'no-replay@gmail.com'

  def thanks_mail(user)
    @user = user
    @url = "http://localhost:3000/users/#{@user.id}"
    mail(subject: "登録完了のお知らせ" ,to: @user.email)
  end
end
