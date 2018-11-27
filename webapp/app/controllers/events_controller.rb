class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  def index
    @events = Event.all.page(params[:page])
  end


  # GET /events/1
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to @event, notice: t('controllers.messages.created', human_name: Rails::Generators::ActiveModel.model_name.human)
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      redirect_to @event, notice: t('controllers.messages.updated', human_name: Rails::Generators::ActiveModel.model_name.human)
    else
      render :edit
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    redirect_to events_url, notice: t('controllers.messages.destroyed', human_name: Rails::Generators::ActiveModel.model_name.human)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event(event_id = params[:id])
    @event = Event.find(event_id)
  end

  # Only allow a trusted parameter "white list" through.
  def event_params
    params.require(:event).permit(:group_id, :name, :url, :place, :kaisai_date, :notices, :announcement, :price, :organizer, :how_apply, :period, :contact_name, :ontact, :location, :access, :parking_lot)
  end
end
