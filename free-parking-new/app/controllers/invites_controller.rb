class InvitesController < ApplicationController
  # before_create :generate_token

  def create
    @invite = Invite.new(invite_params)
    @invite.token = Digest::SHA1.hexdigest([@invite.grouping_id, Time.now, rand].join)
    @invite.sender_id = current_user.id
    if @invite.save
      InviteMailer.new_user_invite(@invite, new_user_path(invite_token: @invite.token)).deliver
    else
      flash[:alert] = "Invalid email, please try again."
      render "groupings#new"
    end
  end

  private

  # def generate_token
  #   self.token = Digest::SHA1.hexdigest([self.grouping_id, Time.now, rand].join)
  # end


  def invite_params
    params.require(:invite).permit(:email, :token, :grouping_id)
  end

end
