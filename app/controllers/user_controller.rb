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
      render :json => @response
    else
      if(u.username.length < 5 || u.username.length > 20)
        error_code = -1
      elsif(u.password.length < 8 || u.password.length > 20)
        error_code = -2
      elsif(User.where(username: u.username)!= [])
        error_code = -3
      end
      @response = ActiveSupport::JSON.encode({error_code: error_code})
      render :json => @response
    end

  end

  def login
    ul = User.where(username: params[:username])

    if ul == []
      error_code = -4
      @response = ActiveSupport::JSON.encode({error_code: error_code})
      render :json => @response
    else
      u=ul[0]
      if u.password == params[:password]
	u.count = u.count + 1
        u.save
        @response = ActiveSupport::JSON.encode({username: u.username, login_count: u.count})
        session[:user_id] = u.username
	session[:logged_in] = true
	render :json => @response
      else
        error_code = -4
	@response = ActiveSupport::JSON.encode({error_code: error_code})
	render :json => @response
      end   
    end
  end

  def clearData
    User.delete_all
  end

  def welcome
    u = User.where(username: session[:user_id])[0]
    @username=u.username
    @count=u.count
  end

  def logout
    session[:logged_in] = false
    session[:user_id] = ''

    redirect_to "/main"
  end
end
