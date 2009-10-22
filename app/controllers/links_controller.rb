class LinksController < ApplicationController
  before_filter :authenticate, :except => [:index]
  
  def index
    
  end
  
  def new
    @link = Link.new(:data => { :url => nil, :title => nil, :description => nil })
  end
  
  def create
    @link = Link.new(:data => { :url => params[:link][:url], :title => params[:link][:title], :description => params[:link][:description]})
    
    if @link.save
      flash[:notice] = "Link was successfully saved."
      redirect_to(posts_path)
    else
      flash.now[:error] = "An error occurred while saving this link."
      render :new
    end
  end
  
  def edit
    @link = Link.find(params[:id])
  end
  
  def update
    @link = Link.find(params[:id])
    
    if @link.update_attributes(params[:link])
      flash[:notice] = "Link was successfully updated."
      redirect_to(posts_path)
    else
      flash.now[:error] = "An error occurred while updating this link."
      render :edit
    end
  end
end
