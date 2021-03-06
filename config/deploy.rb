set :application, "anmeldesystem"

set :scm, :git
set :scm_username, "git"
set :repository,  "#{scm_username}@vmhub1.informatik.tu-muenchen.de:/var/git/anmeldesystem.git"
set :branch, "deploy"
set :deploy_via, :remote_cache

server "vmhub1.informatik.tu-muenchen.de", :app, :web, :db, :primary => true, ssh_options: {config: false}

set :user, 'administrator'
set :web_user, 'www-data'

set :deploy_to, "/var/webapps/#{application}"

set :use_sudo, false

set :asset_env, "RAILS_RELATIVE_URL_ROOT=/anmeldesystem"
default_run_options[:pty] = true

require "bundler/capistrano"
require "rvm/capistrano"

namespace(:custom) do
  
  task :chown, :roles => :app do
    sudo "chown -R #{user}:#{web_user} #{deploy_to}" 
  end
  
  task :symlink, :roles => :app do
    sudo "ln -s #{deploy_to}/current/public /var/www/anmeldesystem"
    sudo "chown -R #{user}:#{web_user} /var/www/anmeldesystem"
  end
end

after "deploy:setup", "custom:chown"
after "deploy:update", "custom:chown"
after "deploy:symlink", "custom:symlink"

 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
 
