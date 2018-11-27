class FacilitiesController < ApplicationController
  layout :user_layout

  def index
    type = params[:type]
    if type.eql?('space') # 利用可能なスペース
      @facilities = Facility.where(renting_space: true).page(params[:page])
    elsif type.eql?('conference') # 会議室
      @facilities = Facility.where(conference: true).page(params[:page])
    elsif type.eql?('performance') # 公演
      @facilities = Facility.where(performance: true).page(params[:page])
    elsif type.eql?('sports') # スポーツ
      @facilities = Facility.where(sports: true).page(params[:page])
    elsif type.eql?('classroom') # 教室
      @facilities = Facility.where(classroom: true).page(params[:page])
    elsif type.eql?('flyer') # チラシを置ける
      @facilities = Facility.where(flyer: true).page(params[:page])

    # 23897 健康・障害・福祉施設
    elsif type.eql?('23897')
      @facilities = Facility.where(facility_category_id: 2).page(params[:page])
    # 23898 教育関連施設
    elsif type.eql?('23898')
      @facilities = Facility.where(facility_category_id: 3).page(params[:page])
    # 23899 消防
    elsif type.eql?('23899')
      @facilities = Facility.where(facility_category_id: 4).page(params[:page])
    # 23900 文化・スポーツ施設・公園
    elsif type.eql?('23900')
      @facilities = Facility.where(facility_category_id: 5).page(params[:page])
    # 23901 子育て関連施設
    elsif type.eql?('23901')
      @facilities = Facility.where(facility_category_id: 6).page(params[:page])
    # 23902 公民館等
    elsif type.eql?('23902')
      @facilities = Facility.where(facility_category_id: 7).page(params[:page])
    # 23903 その他公共施設
    elsif type.eql?('23903')
      @facilities = Facility.where(facility_category_id: 8).page(params[:page])
    # 26277 市役所・支所
    elsif type.eql?('26277')
      @facilities = Facility.where(facility_category_id: 1).page(params[:page])
    # 27487 公園(いいとだパーク)
    elsif type.eql?('27487')
      @facilities = Facility.where(facility_category_id: 9).page(params[:page])
    else # 全て
      @facilities = Facility.all.page(params[:page])
    end
  end

  def show
    @facility = Facility.find(params[:id])
  end
end