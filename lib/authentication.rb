module Authentication
  def self.included(controller)
    controller.send(:include, InstanceMethods)
    controller.extend(ClassMethods)
  end
  
  module ClassMethods
    def self.extended(controller)
      controller.helper_method :current_account, :signed_in?, :signed_out?
      controller.hide_action   :current_account, :current_account=,
                               :signed_in?,   :signed_out?,
                               :sign_in,      :sign_out,
                               :authenticate, :deny_access
      
    end
  end
  
  module InstanceMethods
    def current_account
      @_current_account ||= account_from_cookie
    end
    
    def current_account=(account)
      @_current_account = account
    end
    
    def signed_in?
      ! current_account.nil?
    end
    
    def signed_out?
      current_account.nil?
    end
    
    def authenticate
      deny_access unless signed_in?
    end
    
    def sign_in(account)
      if account
        account.remember_me!
        cookies[:remember_token] = {
          :value   => account.remember_token,
          :expires => 1.year.from_now.utc
        }
        current_account = account
      end
    end
    
    def sign_out
      cookies.delete(:remember_token)
      current_account = nil
    end
    
    def deny_access
      store_location
      flash[:error] = "Sign in required."
      redirect_to(new_session_url)
    end
    
    protected
    
    def account_from_cookie
      if token = cookies[:remember_token]
        Account.find_by_remember_token(token)
      end
    end
    
    def store_location
      if request.get?
        session[:return_to] = request.request_uri
      end
    end
    
    def redirect_back_or(default)
      redirect_to(return_to || default)
      clear_return_to
    end
    
    def return_to
      session[:return_to] || params[:return_to]
    end
    
    def clear_return_to
      session[:return_to] = nil
    end
    
    def redirect_to_root
      redirect_to(root_url)
    end
  end
end
