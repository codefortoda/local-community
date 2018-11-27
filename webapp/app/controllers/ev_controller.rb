class EvController < ApplicationController
  layout :user_layout
  def index
    @events = Event.all.page(params[:page])
  end

  def show
    @event = Event.find(params[:id])
  end
end
