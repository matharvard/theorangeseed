class SessionsController < ApplicationController
  def new
    # render new.html.erb
  end
  
  def create
    @account = Account.authenticate(params[:session][:email], params[:session][:password])
    
    if @account.nil?
      flash.now[:error] = "Bad email or password."
      render :new
    else
      sign_in(@account)
      flash[:notice] = "Signed in."
      redirect_back_or(root_url)
    end
  end
  
  def destroy
    sign_out
    flash[:notice] = "Signed out."
    redirect_to(new_session_url)
  end
end
