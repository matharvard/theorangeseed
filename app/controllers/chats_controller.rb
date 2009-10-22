class ChatsController < ApplicationController
  before_filter :authenticate, :except => [:index]
  
  def index
    
  end
  
  def new
    @chat = Chat.new(:data => { :title => nil, :body => nil})
  end
  
  def create
    @chat = Chat.new(:data => { :title => params[:chat][:title], :body => params[:chat][:body]})
    
    if @chat.save
      flash[:notice] = "Chat was successfully saved."
      redirect_to(posts_path)
    else
      flash.now[:error] = "An error occurred while saving this chat."
      render :new
    end
  end
  
  def edit
    @chat = Chat.find(params[:id])
  end
  
  def update
    @chat = Chat.find(params[:id])
    
    if @chat.update_attributes(params[:chat])
      flash[:notice] = "Chat was successfully updated."
      redirect_to(posts_path)
    else
      flash.now[:error] = "An error occurred while updating this chat."
      render :edit
    end
  end
end
