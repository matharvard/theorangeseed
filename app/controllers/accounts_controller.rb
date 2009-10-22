class AccountsController < ApplicationController
  before_filter :authenticate,
                :find_account
  
  def new
    @account = Account.new
  end
  
  def create
    @account = Account.new(params[:account])
    
    if @account.save
      flash[:notice] = "Account was successfully created."
      redirect_to(settings_path)
    else
      render :new
    end
  end
  
  def settings; ;end
  
  def update
    if @account.update_attributes(params[:account])
      flash[:notice] = "Your account was successfully updated"
      redirect_to(settings_path)
    else
      flash.now[:error] = "An error occurred while updating your account."
      render :settings
    end
  end
  
  def password; ;end
  
  def update_password
    if @account.update_password(params[:account][:password],
                                params[:account][:password_confirmation])
      sign_in(@account)
      flash[:notice] = "Password was successfully changed."
      redirect_to(settings_path)
    else
      render :password
    end
  end
  
  def destroy
    flash[:error] = "[WARNING] Not yet implemented."
    redirect_to(settings_path)
  end
  
  private
  
  def find_account
    @account = current_account
  end
end
