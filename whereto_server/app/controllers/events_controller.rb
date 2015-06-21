class EventsController < ApplicationController
  before_action :allow_cross_domain

  def index
    @event = Event.all.sample
    @user = User.find(params[:user_id])
    ## Put badass query here to generate event
    render json: {user: @user, event: @event}
  end

  def show
  end

  private

    def allow_cross_domain
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    end

end
