module SessionsHelper
  def require_login
    unless logged_in?
      flash[:notice] = "Please log in."
      redirect_to login_url 
    end
  end
  def log_in user
    session[:user_id] = user.id
    @current_user = nil
  end

  def logged_in?
  
     !current_user.nil?
  end    
    
  def current_user
     if !session[:user_id].nil?
        if @current_user.nil?
            # if id not in DB, find_by returns nil
            @current_user = User.find_by(id: session[:user_id])
        end
     else
        @current_user = nil
     end
     return @current_user 
  end
    
  def log_out
      session.delete(:user_id)
      @current_user = nil
  end
    
end