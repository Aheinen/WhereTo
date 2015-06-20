class UsersController < ApplicationController

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
    get_user
    interests = @user.interests
    categories = Category.all
    render 'edit.json.jbuilder'
  end

  def update
    # destroy existing interests and repopulate?
  end

  def destroy
  end

  private

  def get_user
    # What are we going to be sending back and forth?
    @user = User.find()
  end

  def user_params
    params.permit(:first_name, :last_name, :email, :phone, :city, :image)
  end

end
