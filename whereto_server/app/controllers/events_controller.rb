class EventsController < ApplicationController

  def index
    user = User.find(params[:user_id])
    ## Put badass query here to generate event
    render json: {user: "hello", event: "hi"}
  end

  def show
  end

end
