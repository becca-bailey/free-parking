class GroupingsController < ApplicationController
  def destroy
    grouping = Grouping.find(params[:id])
    grouping.destroy
    redirect_to user_path(current_user)
  end
end
