class ReviewsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @review = Review.new(review_params)
    @review.for_user_id = params[:user_id]
    @review.by_user_id = current_user.id

    @review.save

    redirect_to user_path(@review.for_user_id)
  end

  def destroy
  end

  def edit
  end

  def update
  end
  def review_params
    params.require(:review).permit(:title, :body)
  end
end
