class VideosController < ApplicationController
  before_filter :authenticate, :except => [:index]
  
  def index
    
  end
  
  def new
    @video = Video.new(:data => { :embed_code => nil, :caption => nil })
  end
  
  def create
    @video = Video.new(:data => { :embed_code => params[:video][:embed_code], :caption => params[:video][:caption] })
    
    if @video.save
      flash[:notice] = "Video was successfully saved."
      redirect_to(posts_path)
    else
      flash.now[:error] = "An error occurred while saving this video."
      render :new
    end
  end
  
  def edit
    @video = Video.find(params[:id])
  end
  
  def update
    @video = Video.find(params[:id])
    
    if @video.update_attributes(params[:video])
      flash[:notice] = "Video was succesfully updated."
      redirect_to(posts_path)
    else
      flash.now[:error] = "An error occurred while updating this video."
      render :edit
    end
  end
end
