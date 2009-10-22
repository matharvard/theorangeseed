class SnippetsController < ApplicationController
  before_filter :authenticate, :except => [:index]
  
  def index
    
  end
  
  def new
    @snippet = Snippet.new(:data => { :title => nil, :code => nil })
  end
  
  def create
    @snippet = Snippet.new(:data => { :title => params[:snippet][:title], :code => params[:snippet][:code] })
    
    if @snippet.save
      flash[:notice] = "Snippet was successfully saved."
      redirect_to(posts_path)
    else
      flash.now[:error] = "An error occurred while saving this snippet."
      render :new
    end
  end
  
  def edit
    @snippet = Snippet.find(params[:id])
  end
  
  def update
    @snippet = Snippet.find(params[:id])
    
    if @snippet.update_attributes(params[:snippet])
      flash[:notice] = "Snippet was successfully updated."
      redirect_to(posts_path)
    else
      flash.now[:error] = "An error occurred while updating this snippet"
      render :edit
    end
  end
end
