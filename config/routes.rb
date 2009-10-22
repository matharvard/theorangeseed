ActionController::Routing::Routes.draw do |map|
  map.resource :session,
    :only => [:new, :create, :destroy]
  
  map.sign_in "sign_in",
    :controller => "sessions",
    :action => :new
  
  map.sign_out "sign_out",
    :controller => "sessions",
    :action => :destroy
  
  map.resource :account,
    :member => [:settings, :password]
  
  map.update_password_account "account/update_password",
    :controller => "accounts",
    :action => "update_password",
    :conditions => { :method => :put }
  
  map.settings "settings",
    :controller => "accounts",
    :action => :settings
  
  map.with_options :except => [:show, :destroy] do |post|
    post.resources :articles
    post.resources :audio, :plural => "audio", :singular => "audio"
    post.resources :chats
    post.resources :links
    post.resources :photos
    post.resources :quotes
    post.resources :snippets
    post.resources :videos
  end
  
  map.resources :posts,
    :only => [:index, :show, :destroy]
  
  map.root :posts
end
