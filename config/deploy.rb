set :application, "theorangeseed.com"
set :repository,  "git@matharvard.ca:theorangeseed.git"

default_run_options[:pty] = true
set :use_sudo, false

set :deploy_to, "/var/www/#{application}"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
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
  end
end

after "deploy", "deploy:cleanup" # keeps only last 5 releases
after "deploy", "deploy:symlink_extras"