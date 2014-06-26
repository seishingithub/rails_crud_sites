class SitesController < ApplicationController

  def index
    @site = Site.new
    @sites = Site.all
  end

  def create
    @site = Site.create(site_params)
    if @site.save
      redirect_to sites_path
    else
      render :index
    end
  end

  private
  def site_params
    params.require(:site).permit(:site_name, :location)
  end
end