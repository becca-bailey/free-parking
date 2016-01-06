class GroupsController < ApplicationController
  before_action :check_membership, only: [:show]
  before_action :authorize

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(name: params[:group][:name])
    if @group.save
      flash[:notice] = "You have successfully created a group!"
      current_user.groups << @group
      redirect_to group_path(@group)
    else
      flash[:alert] = "There was a problem.  Please try again."
      render "groups/new"
    end
  end

  private

  def check_membership
    @group = Group.find(params[:id])
    unless @group.members.include?(current_user)
      flash[:notice] = "You must be a member to view this gruop."
      redirect_to login_path
    end
  end

end
