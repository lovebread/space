class ChineseRegionController < ApplicationController

  before_filter :login_required, :setup

  def regions
    render :json => Region.all
  end

  def cities
    render :json => @region.cities
  end

  def districts
    render :json => @city.districts
  end

protected

  def setup
    if ["cities"].include? params[:action]
      @region = Region.find(params[:region_id])
    elsif ["districts"].include? params[:action]
      @region = Region.find(params[:region_id])
      @city = @region.cities.find(params[:city_id])
    end
  rescue
    not_found
  end

end
