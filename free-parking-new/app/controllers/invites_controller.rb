class InvitesController < ApplicationController

  def new
    @invite = Invite.new
  end

  def create
    @invite = Invite.new(invite_params)
    puts params
    puts params[:group_id]
    @grouping = Grouping.create(group_id: params[:group_id])
    @invite.sender = current_user
    @invite.grouping = @grouping
    if @invite.save
      puts "Saved!!"
      InviteMailer.send_invite(@invite).deliver_now
      flash[:message] = "Invite sent!"
      redirect_to root_path
    else
      flash[:alert] = "Invalid email, please try again."
      render "invites/new"
    end
  end

  private

  def invite_params
    params.require(:invite).permit(:email, :token)
  end

end
