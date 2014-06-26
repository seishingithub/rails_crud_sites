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

  def show
    @site = Site.find(params[:id])
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])
    @site.update_attributes!(site_params)

    redirect_to sites_path
  end

  def destroy
    @site = Site.find(params[:id]).delete

    redirect_to sites_path
  end

  private
  def site_params
    params.require(:site).permit(:site_name, :location)
  end
end