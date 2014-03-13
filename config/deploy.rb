
require "bundler/capistrano"
set :stages, ["staging", "production"]
set :default_stage, "staging"

set :application, 'ruzure'
set :scm, :git
set :repo_url, 'git@github.com:brainstain/ruzure.git'
set :scm_passphrase, "Guttle35"
set :branch, "master"
set :user, "brian"
set :use_sudo, true

namespace :deploy do

  desc "Fix permissions"
  task :fix_permissions, [ :app, :db, :web ] => :roles  do
    run "chmod +x #{release_path}/config/unicorn_init.sh"
  end

  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "service unicorn_#{application} #{command}"
    end
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    sudo "mkdir -p #{shared_path}/config"
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    # Add database config here
  end
  after "deploy:finalize_update", "deploy:fix_permissions"
  after "deploy:finalize_update", "deploy:symlink_config"

end
