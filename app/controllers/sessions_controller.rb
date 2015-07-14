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
    puts @user
    session[:user_id] = @user.id
    flash[:success] = "Welcome, #{@user.first_name}!"
    
    if current_user.bio 
      redirect_to user_path(@user)
    else
      redirect_to edit_user_path(@user)
    end
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
