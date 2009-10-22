set :application, "theorangeseed.com"
set :repository,  "git@matharvard.ca:theorangeseed.git"

default_run_options[:pty] = true
set :use_sudo, false

set :deploy_to, "/var/www/#{application}"

set :scm, :git
set :user, "deploy"

role :app, application
role :web, application
role :db,  application, :primary => true

namespace :deploy do
  desc "Tell Passenger to restart."
  task :restart, :roles => :web do
    run "touch #{deploy_to}/current/tmp/restart.txt" 
  end
  
  desc "Symlink extra configs and folders."
  task :symlink_extras do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/public/assets #{release_path}/public/assets"
  end
end

after "deploy", "deploy:cleanup"
after "deploy", "deploy:symlink_extras"
