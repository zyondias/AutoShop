set :application, "AutoShop"
set :repository,  "https://github.com/zyondias/AutoShop.git"
set :branch, 'master'
set :scm, "git"

set :deploy_to, "/var/www/AutoShop"
set :current, "#{deploy_to}/current"
set :deploy_via, :remote_cache
# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "192.168.0.60"          # Your HTTP server, Apache/etc
role :app, "192.168.0.60"  # This may be the same as your `Web` server
role :db,  "192.168.0.60", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

set :user, "webserver"
set :runner, "webserver"
set :group, "webserver"
set :use_sudo, false


set :keep_releases, 5
ssh_options[:forward_agent] = true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
after :deploy, 'deploy:database'
namespace :deploy do
	task :database, :roles => :app do 
	  run "cp #{depoy_to}/shared/database.yml #{current_path}/config/" 
	end
end
