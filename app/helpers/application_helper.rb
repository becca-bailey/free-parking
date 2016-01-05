module ApplicationHelper

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def authorize
    unless current_user
      flash[:notice] = "Please log in."
      redirect_to login_path
    end
  end

   def logged_in?
     current_user != nil
   end

end
