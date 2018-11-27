class Manage::FacilityCategoriesController < ApplicationController
  before_action :set_facility_category, only: [:show, :edit, :update, :destroy]
  layout 'manage'

  # GET /facility_categories
  def index
    @facility_categories = FacilityCategory.all.page(params[:page])
  end

  # GET /facility_categories/1
  def show
  end

  # GET /facility_categories/new
  def new
    @facility_category = FacilityCategory.new
  end

  # GET /facility_categories/1/edit
  def edit
  end

  # POST /facility_categories
  def create
    @facility_category = FacilityCategory.new(facility_category_params)

    if @facility_category.save
      redirect_to [:manage, @facility_category], notice: 'Facility category was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /facility_categories/1
  def update
    if @facility_category.update(facility_category_params)
      redirect_to [:manage, @facility_category], notice: 'Facility category was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /facility_categories/1
  def destroy
    @facility_category.destroy
    redirect_to manage_facility_categories_url, notice: 'Facility category was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facility_category
      @facility_category = FacilityCategory.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def facility_category_params
      params.require(:facility_category).permit(:name, :sys_flag)
    end
end
