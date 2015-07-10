class UsersController < ApplicationController
  def index
    @users= User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)

    redirect_to user_path(@user)
  end

  def destroy
  end

private

  ## Defining the paraments for the users
  def user_params
    params.require(:user).permit(:first_name, :last_name, :image, :bio, :phone, :email, :city, :state, :instructor, :provider, :uid, :oauth_token, :oauth_expires_at)
  end

end
