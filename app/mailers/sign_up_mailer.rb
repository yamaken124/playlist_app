class SignUpMailer < ApplicationMailer
  default from: "Music Cafe"

  def sign_up_email(user)
    @greet = "Hi"
    @name = user.name
    mail to: user.email, subject: "【Music Cafe】新規登録完了のお知らせ"
  end
end
