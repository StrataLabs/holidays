require 'bundler/capistrano'

set :application, "holidays"
set :repository,  "git@github.com:StrataLabs/holidays.git"
set :deploy_to, "/var/www/rails/#{application}"
set :user, "rails"
set :use_sudo, false
set :scm, :git
set :branch, "master"
set :rails_env, "production"
set :deploy_via, :remote_cache

task :staging do
  role :app, "ec2-50-19-205-182.compute-1.amazonaws.com"
end

set :default_environment, {
  'PATH' =>         "/usr/local/rvm/bin:/usr/local/rvm/gems/ruby-1.9.2-p290/bin:/usr/local/rvm/gems/ruby-1.9.2-p290@global/bin:/usr/local/rvm/rubies/ruby-1.9.2-p290/bin:$PATH",
  'GEM_HOME' =>     "/usr/local/rvm/gems/ruby-1.9.2-p290",
  'GEM_PATH' =>     "/usr/local/rvm/gems/ruby-1.9.2-p290:/usr/local/rvm/gems/ruby-1.9.2-p290@global"
}

namespace :deploy do
  after "bundle:install" do
    run "cd #{release_path} && RAILS_ENV=#{fetch(:rails_env)} bundle exec rake assets:precompile"
  end

 task :start do ; end
 task :stop do ; end
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 end
 task :migrate do ; end
end
