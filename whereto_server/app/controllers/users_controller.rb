class UsersController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  # Create or Login user
  def create
    p params
    @user = User.find_by(email: params[:email])
    if @user
      redirect_to user_events_path(@user)
      # redirect_to '/events'
    else
      @user = User.new(user_params)
      @user.city = 'San Francisco'
      if @user.save
        redirect_to edit_user_path(@user)
      end
    end
  end

  # Edit preferences
  def edit
    p params
    get_user
    interests = @user.interests
    @categories = Category.all
    render 'edit.json.jbuilder'
  end

  def update
    @user.interests.destroy_all
    @user.interests.create(params[:interests])
    redirect 'events/index'
  end

  # Access All Categories
  def categories
    @categories = Category.all

    render json: {categories: @categories}
  end

  private

  def get_user
    # What are we going to be sending back and forth?
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:first_name, :last_name, :email, :phone, :city, :image)
  end

end
