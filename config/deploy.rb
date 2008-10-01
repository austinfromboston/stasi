set :application, "stasi"
set :repository,  "git@github.com:austinfromboston/stasi.git"

set :user, "stasi"
default_run_options[:pty] = true

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/stasi/stasi"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git
set :deploy_via, :remote_cache

role :app, "zheng.radicaldesigns.org"
role :web, "zheng.radicaldesigns.org"
role :db,  "zheng.radicaldesigns.org", :primary => true

after "deploy:update_code", "deploy:symlink_shared"

namespace :deploy do
  task :symlink_shared, :roles => :app, :except => {:no_symlink => true} do
    invoke_command "ln -nfs #{shared_path}/config/auth_server.yml #{release_path}/config/auth_server.yml"
    invoke_command "ln -nfs #{shared_path}/config/linein.yml #{release_path}/config/linein.yml"
    invoke_command "ln -nfs #{shared_path}/config/api_access_key.yml #{release_path}/config/api_access_key.yml"
    invoke_command "ln -nfs #{shared_path}/config/basecamp.yml #{release_path}/config/basecamp.yml"
    invoke_command "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    invoke_command "ln -nfs #{shared_path}/config/mongrel_cluster.yml #{release_path}/config/mongrel_cluster.yml"
    invoke_command "ln -nfs #{shared_path}/config/contact_grudges_development.yml #{release_path}/config/contact_grudges_development.yml"
    invoke_command "ln -nfs #{shared_path}/config/imported_contacts_and_projects.yml #{release_path}/config/imported_contacts_and_projects.yml"

    # clear stylesheets folder
    #invoke_command "rm #{release_path}/public/stylesheets/*css"
  end


end
