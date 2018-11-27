class Manage::FacilitiesController < ApplicationController
  before_action :set_facility, only: [:show, :edit, :update, :destroy]
  layout 'manage'

  # GET /facilities
  def index
    @facilities = Facility.all.page(params[:page])
  end


  # GET /facilities/1
  def show
  end

  # GET /facilities/new
  def new
    @facility = Facility.new
  end

  # GET /facilities/1/edit
  def edit
  end

  # POST /facilities
  def create
    @facility = Facility.new(facility_params)

    if @facility.save
      redirect_to [:manage, @facility], notice: t('controllers.messages.created', human_name: Rails::Generators::ActiveModel.model_name.human)
    else
      render :new
    end
  end

  # PATCH/PUT /facilities/1
  def update
    if @facility.update(facility_params)
      redirect_to [:manage, @facility], notice: t('controllers.messages.updated', human_name: Rails::Generators::ActiveModel.model_name.human)
    else
      render :edit
    end
  end

  # DELETE /facilities/1
  def destroy
    @facility.destroy
    redirect_to manage_facilities_url, notice: t('controllers.messages.destroyed', human_name: Rails::Generators::ActiveModel.model_name.human)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_facility(facility_id = params[:id])
    @facility = Facility.find(facility_id)
  end

  # Only allow a trusted parameter "white list" through.
  def facility_params
    params.require(:facility).permit(:identifier, :organization_code, :organization_name, :identifier_name, :name, :overview, :common_name, :address, :latitude, :longitude, :tel, :url, :barrier_free, :facility_category_id, :image, :image_cache, :remove_image)
  end
end
