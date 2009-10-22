class QuotesController < ApplicationController
  before_filter :authenticate, :except => [:index]
  
  def index
    
  end
  
  def new
    @quote = Quote.new(:data => { :body => nil, :source => nil })
  end
  
  def create
    @quote = Quote.new(:data => { :body => params[:quote][:body], :source => params[:quote][:source] })
    
    if @quote.save
      flash[:notice] = "Quote was successfully saved."
      redirect_to(posts_path)
    else
      flash.now[:error] = "An error occurred while saving this quote."
      render :new
    end
  end
  
  def edit
    @quote = Quote.find(params[:id])
  end
  
  def update
    @quote = Quote.find(params[:id])
    
    if @quote.update_attributes(params[:quote])
      flash[:notice] = "Quote was successfully updated."
      redirect_to(posts_path)
    else
      flash.now[:error] = "An error occured while updating this quote."
      render :edit
    end
  end
end
