class GroupsController < ApplicationController
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
      redirect_to group_path(@group)
    else
      flash[:alert] = "There was a problem.  Please try again."
      render "groups/new"
    end
  end
end
