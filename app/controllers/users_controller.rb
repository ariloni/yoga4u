class UsersController < ApplicationController
  def index
    @users= User.all
  end

  def show
    @user = User.find(params[:id])

    @review = Review.new
    @review.for_user_id = @user.id
    @review.by_user_id = current_user.id
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id.to_s
    end
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
    @user = User.find(params[:id])
    if @user.id = current_user.id
      session.delete(:user_id)
      @user.destroy
    end
    redirect_to root_path
  end

private

  ## Defining the paraments for the users
  def user_params
    params.require(:user).permit(:first_name, :last_name, :image, :bio, :phone, :email, :city, :state, :instructor, :provider, :student, :uid, :oauth_token, :oauth_expires_at)
  end

end
