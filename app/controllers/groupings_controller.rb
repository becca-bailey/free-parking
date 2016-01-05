class GroupingsController < ApplicationController
  def new
    @invite = Invite.new
    # @grouping = Grouping.create!
    # @invite.grouping_id = @grouping.id
  end

  def create
    @grouping = Grouping.new(user_id: current_user.id, group_id: params[:group_id])
    if @grouping.save
      redirect_to group_path(@grouping.group)
    else
      flash[:alert] = "Something went wrong, please try again."
      render "groupings#new"
    end

  end
end
