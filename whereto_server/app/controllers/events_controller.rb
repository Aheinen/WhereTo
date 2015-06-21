class EventsController < ApplicationController
  before_action :allow_cross_domain

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

  private

    def allow_cross_domain
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    end

end
