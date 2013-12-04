#server "10.10.1.100", :app, :web, :db, :primary => true
server "23.23.230.89", :web
#server "10.10.1.106", :web
set :deploy_to, "/srv/www/humble_store.staging"

set :thin_config_file, "./config/thin.staging.yml"
set :thin_pid_file, "#{shared_path}/pids/thin.staging.pid"