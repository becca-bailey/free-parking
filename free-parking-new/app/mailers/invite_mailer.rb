class InviteMailer < ApplicationMailer
  default from: "freeparking37@gmail.com"
  def send_invite(user)
    @user = user
    mail(to: @user.email, subject: "This is an email.")
  end
end
