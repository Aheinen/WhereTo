class EventsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    ## Put badass query here to generate event
    render json: {user: @user, event: event}
  end

  def show
  end

end
