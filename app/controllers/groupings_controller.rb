class GroupingsController < ApplicationController
  def destroy
    grouping = Grouping.find(params[:id])
    grouping.destroy
    redirect_to root_path
  end
end
