module SessionHelper
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def current_user
    if (user_id = session[:user_id])
      @currnet_user ||= User.find_by(id: user_id)
    end
  end
  
  def log_out
    ession.delete(:user_id)
    redirect_to root_path
  end
  
  def logged_in?
    !current_user.nil?
  end
end