class ArticlesController < ApplicationController
  before_filter :authenticate, :except => [:index]
  
  def index
    
  end
  
  def new
    @article = Article.new(:data => { :title => nil, :body => nil})
  end
  
  def create
    @article = Article.new(:data => { :title => params[:article][:title], :body => params[:article][:body]})
    
    if @article.save
      flash[:notice] = "Article was successfully saved."
      redirect_to(posts_path)
    else
      flash.now[:error] = "An error occurred while saving this article."
      render :new
    end
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    
    if @article.update_attributes(params[:article])
      flash[:notice] = "Article was successfully updated."
      redirect_to(posts_path)
    else
      flash.now[:error] = "An error occurred while updating this article."
      render :edit
    end
  end
end
