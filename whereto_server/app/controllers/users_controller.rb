class UsersController < ApplicationController

  # Create or Login user
  def create
    user = User.find(email: params[:email])
    if user
      redirect 'events/show'
    else
      user = User.new()
      if user.save
        redirect 'edit'
      end
    end
  end

  # Edit preferences
  def edit
    user = User.find(params[:id])
    interests = user.interests
    categories = Category.all



    # render json: {user: user, categories: categories}
  end

  def update

  end

  def destroy
  end

  private
  def get_user
    # What are we going to be sending back and forth?
    user = User.find()
  end

end
