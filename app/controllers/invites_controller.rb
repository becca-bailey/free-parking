class InvitesController < ApplicationController
  before_action :check_membership, only: [:new, :create]

  def new
    @invite = Invite.new
    @group = Group.find(params[:group_id])
  end

  def create
    @invite = Invite.new(invite_params)
    @grouping = Grouping.create(group_id: params[:group_id])
    @invite.sender = current_user
    @invite.grouping = @grouping
    if @invite.save
      InviteMailer.send_invite(@invite).deliver_now
      flash[:message] = "Invite sent!"
      redirect_to "/"
    else
      flash[:alert] = "Invalid email, please try again."
      render "invites/new"
    end
  end

  def accept
    @token = params[:invite_token]
    session[:token] = @token
    invite = Invite.find_by(token: @token)
    @user = invite.recipient
    if @user != nil
      redirect_to login_path
    else
      redirect_to new_user_path
    end
  end

  def show
    @invite = Invite.find(params[:id])
    @group = Group.find(params[:group_id])
  end

  def join
    invite = Invite.find(params[:id])
    game_group = Group.find(params[:group_id])
    current_user.groups << game_group
    session.delete(:token)
    redirect_to group_path(game_group)
  end

  private

  def invite_params
    params.require(:invite).permit(:email, :token)
  end

  def check_membership
    @group = Group.find(params[:group_id])
    unless @group.members.include?(current_user)
      flash[:notice] = "You must be a member to invite people to join this group.."
      redirect_to login_path
    end
  end

end
