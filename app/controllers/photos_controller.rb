class PhotosController < ApplicationController
  before_filter :authenticate, :except => [:index]
  
  def index
    
  end
  
  def new
    @photo = Photo.new(:data => { :caption => nil })
  end
  
  def create
    @photo = Photo.new(:attachment => params[:photo][:attachment], :data => { :caption => params[:photo][:caption] })
    
    if @photo.save
      flash[:notice] = "Photo was successfully saved."
      redirect_to(posts_path)
    else
      flash.now[:error] = "An error occurred while saving this photo."
      render :new
    end
  end
  
  def edit
    @photo = Photo.find(params[:id])
  end
  
  def update
    @photo = Photo.find(params[:id])
    
    if @photo.update_attributes(params[:photo])
      flash[:notice] = "Photo was successfully updated."
      redirect_to(posts_path)
    else
      flash.now[:error] = "An error occured while updating this photo."
      render :edit
    end
  end
end
