class SessionsController < ApplicationController
  def new
    
  end

  def show
    
  	@auth = session['auth']
  end

  def create
  	#render text: request.env['omniauth.auth'].to_yaml
  	# Fetches the OAuth response info
    # @auth = request.env['omniauth.auth']
    # session['auth'] = @auth
    # redirect_to sessions_show_path
    
    @user = User.from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = @user.id
    flash[:success] = "Welcome, #{@user.first_name}!"
    
	
    redirect_to edit_user_path(@user)
  end

  def destroy
  	if current_user
      session.delete(:user_id)
      flash[:success] = 'See you!'
    end
    
    redirect_to root_path
  end

  def auth_failure
    redirect_to root_path
  end
end
