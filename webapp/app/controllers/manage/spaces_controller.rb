class Manage::SpacesController < ApplicationController
  before_action :set_space, only: [:show, :edit, :update, :destroy]
  layout 'manage'

  # GET /spaces
  def index
    @spaces = Space.all.page(params[:page])
  end


  # GET /spaces/1
  def show
  end

  # GET /spaces/new
  def new
    facility_id = params[:facility_id]
    @facility = Facility.find(facility_id)
    @space = Space.new
    @space.facility = @facility
  end

  # GET /spaces/1/edit
  def edit
  end

  # POST /spaces
  def create
    @space = Space.new(space_params)

    if @space.save
      redirect_to [:manage, @space], notice: t('controllers.messages.created', human_name: Space.model_name.human)
    else
      render :new
    end
  end

  # PATCH/PUT /spaces/1
  def update
    if @space.update(space_params)
      redirect_to [:mabage, @space], notice: t('controllers.messages.updated', human_name: Space.model_name.human)
    else
      render :edit
    end
  end

  # DELETE /spaces/1
  def destroy
    @space.destroy
    redirect_to manage_spaces_url, notice: t('controllers.messages.destroyed', human_name: Space.model_name.human)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_space(space_id = params[:id])
    @space = Space.find(space_id)
  end

  # Only allow a trusted parameter "white list" through.
  def space_params
    params.require(:space).permit(:name, :image, :detail, :facility_id, :image_cache, :remove_image)
  end
end
