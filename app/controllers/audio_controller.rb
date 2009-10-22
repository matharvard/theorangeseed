class AudioController < ApplicationController
  before_filter :authenticate, :except => [:index]
  self.prepend_view_path("views/audio")
  
  def index
    
  end
  
  def new
    @audio = Audio.new(:data => { :description => nil })
  end
  
  def create
    @audio = Audio.new(:attachment => params[:audio][:attachment], :data => { :description => params[:audio][:description] })
    
    if @audio.save
      flash[:notice] = "Audio post was successfully saved."
      redirect_to(posts_path)
    else
      flash.now[:error] = "An error occurred while saving this audio post."
      render :new
    end
  end
  
  def edit
    @audio = Audio.find(params[:id])
  end
  
  def update
    @audio = Audio.find(params[:id])
    
    if @audio.update_attributes(params[:audio])
      flash[:notice] = "Audio post was successfully updated."
      redirect_to(posts_path)
    else
      flash.now[:error] = "An error occurred while updating this audio post."
      render :edit
    end
  end
end
