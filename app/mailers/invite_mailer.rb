class InviteMailer < ApplicationMailer
  default from: "freeparking37@gmail.com"
  def send_invite(invite)
    @invite = invite
    puts @invite.email
    mail(to: @invite.email, subject: "This is an email.")
  end
end
