class EventsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    event = Event.featured_events(@user.interests_ids, @user.city, @user.wishlist_ids).limit(1)
    render json: {user: @user, event: event}
  end

  def list
    @user = User.find(params[:user_id])
    events = Event.featured_events(@user.interests_ids, @user.city, @user.wishlist_ids).limit(20)
    render json: {user: @user, events: events}
  end
end
