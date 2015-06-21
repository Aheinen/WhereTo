class EventsController < ApplicationController

  def index
    @event = Event.all.sample
    @events = Event.all
    @user = User.find(params[:user_id])
    ## Put badass query here to generate event
    render json: {user: @user, event: @event, events: @events}
  end

  def show
  end
end
