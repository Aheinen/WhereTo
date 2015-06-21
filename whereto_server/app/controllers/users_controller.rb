class UsersController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  # Create or Login user
  def create
    @user = User.find(email: params[:email])
    if @user
      redirect 'events/index'
    else
      @user = User.new(user_params)
      if @user.save
        redirect 'edit'
      end
    end
  end

  # Edit preferences
  def edit
    @interests = @user.interests
    @categories = Category.all
    render 'edit.json.jbuilder'
  end

  def update
    @user.interests.destroy_all
    @user.interests.create(params[:interests])
    redirect 'events/index'
  end

  private

  def get_user
    @user = User.find(email: params[:email])
  end

  def user_params
    params.permit(:first_name, :last_name, :email, :phone, :city, :image)
  end

end
