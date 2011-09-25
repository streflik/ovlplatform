set :application, "OVL"

set :deploy_to, "/home/ovlplatform/www/ovlplatform/"
set :deploy_via, :remote_cache
set :user, "ovlplatform"
set :use_sudo, false

set :scm, :git
set :scm_username, "streflik"
set :repository, "git@github.com:bartekrycharski/ovlplatform.git"
set :branch, "master"
set :git_enable_submodules, 1
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "ovlplatform.megiteam.pl"                          # Your HTTP server, Apache/etc
role :app, "ovlplatform.megiteam.pl"                          # This may be the same as your `Web` server
role :db,  "ovlplatform.megiteam.pl", :primary => true # This is where Rails migrations will run
role :db,  "ovlplatform.megiteam.pl"

namespace :deploy do
  task :start, :roles => :app do
    run "restart-app ovlplatform"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "restart-app ovlplatform"
  end

  desc "Symlink shared resources on each release"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'

namespace :bundler do
  desc "Symlink bundled gems on each release"
  task :symlink_bundled_gems, :roles => :app do
    run "mkdir -p #{shared_path}/bundled_gems"
    run "ln -nfs #{shared_path}/bundled_gems #{release_path}/vendor/bundle"
  end

  desc "Install for production"
  task :install, :roles => :app do
    run "cd #{release_path} && bundle install"
  end

end

#namespace :db do
#  desc "Run migrations"
#  task :migrate, :roles => :app do
#    run "cd #{release_path} && rake db:migrate RAILS_ENV=production"
#  end
#end

after 'deploy:update_code', 'bundler:symlink_bundled_gems'
after 'deploy:update_code', 'bundler:install'
#after 'bundler:install', "db:migrate"
before  "deploy:symlink", "deploy:migrate"