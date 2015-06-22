class InterestsController < ApplicationController
  before_action :get_user

  def create
    interests_ids = params[:interests].map {|i| {category_id: i.to_i}}
    @user.interests.destroy_all
    @user.interests.create(interests_ids)
    redirect_to user_events_path(@user)
  end

  private
  def get_user
    @user = User.find(params[:user_id])
  end
end
