class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
  layout :user_layout

  # GET /groups
  def index
    @groups = Group.all.page(params[:page])
  end


  # GET /groups/1
  def show
  end

  # GET /groups/new
  def new
    @group = Group.new
    @group.user = current_user
  end

  # GET /groups/1/edit
  def edit
  end

  # POST /groups
  def create
    @group = Group.new(group_params)
    @group.user = current_user

    if @group.save
      redirect_to @group, notice: t('controllers.messages.created', human_name: Group)
    else
      render :new
    end
  end

  # PATCH/PUT /groups/1
  def update
    if @group.update(group_params)
      redirect_to @group, notice: t('controllers.messages.updated', human_name: Group)
    else
      render :edit
    end
  end

  # DELETE /groups/1
  def destroy
    @group.destroy
    redirect_to groups_url, notice: t('controllers.messages.destroyed', human_name: Group)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group(group_id = params[:id])
    @group = Group.find(group_id)
  end

  # Only allow a trusted parameter "white list" through.
  def group_params
    params.require(:group).permit(:name, :introduction, :image, :facebook_url, :url, :description, :user_id, :image_cache, :remove_image)
  end
end
