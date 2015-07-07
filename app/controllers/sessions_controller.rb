class SessionsController < ApplicationController
  def new
  end

  def show
  	redirect_to root_path unless session['auth']
  	@auth = session['auth']
  end

  def create
  	# Fetches the OAuth response info
    @auth = request.env['omniauth.auth']
    session['auth'] = @auth
    redirect_to users_edit_path
  end

  def destroy
  	session['auth'] = nil
  	redirect_to root_path
  end
end
