class UserController < ApplicationController
  def main
  end

  def signup
    u = User.new
    u.username = params[:username]
    u.password = params[:password]
    u.count = 1

    if u.save
      @response = ActiveSupport::JSON.encode({username: u.username, login_count: u.count})
      session[:user_id] = u.username
      session[:logged_in] = true
      redirect_to "/welcome"
    else
      if(u.username.length < 5 || u.username.length > 20)
	flash[:alert] = "The user name should be 5~20 characters long. Please try again."
        error_code = -1
      elsif(u.password.length < 8 || u.password.length > 20)
	flash[:alert] = "The password should be 8~20 characters long. Please try again."
        error_code = -2
      elsif(User.where(username: u.username)!= [])
	flash[:alert] = "This user name already exists. Please try again."
        error_code = -3
      end
      @response = ActiveSupport::JSON.encode({error_code: error_code})
      redirect_to "/main"
    end

  end

  def login
    u = User.where(username: params[:username])[0]
     
    if u.password == params[:password]
      u.count = u.count + 1
      u.save
      @response = ActiveSupport::JSON.encode({username: u.username, login_count: u.count})
      session[:user_id] = u.username
      session[:logged_in] = true
      redirect_to "/welcome"
    else
      flash[:alert] = "Invalid username and password combination. Please try again."
      error_code = -4
      @response = ActiveSupport::JSON.encode({error_code: error_code})
      redirect_to "/main"
    end   
  end

  def clearData
  end

  def welcome
    u = User.where(session[:user_id])[0]
    @username=u.username
    @count=u.count
  end
end
