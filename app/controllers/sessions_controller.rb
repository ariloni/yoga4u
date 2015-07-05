class SessionsController < ApplicationController
  def new
  end

  def show
  end

  def create
  	# Fetches the OAuth response info
    @auth = request.env['omniauth.auth']
  end

  def destroy
  end
end
