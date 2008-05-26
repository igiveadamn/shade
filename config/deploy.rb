# Please install the Engine Yard Capistrano gem
# gem install eycap --source http://gems.engineyard.com

require "eycap/recipes"

# =============================================================================
# ENGINE YARD REQUIRED VARIABLES
# =============================================================================
# You must always specify the application and repository for every recipe. The
# repository must be the URL of the repository you want this recipe to
# correspond to. The :deploy_to variable must be the root of the application.

set :keep_releases,       5
set :application,         "africa"
set :repository,          "http://justcause.svnrepository.com/svn/shade/trunk"
set :scm_username,       "engineyard"
set :scm_password,       "mavis"
set :user,                "africa"
set :password,            "muggOnod"
set :deploy_to,           "/data/#{application}"


set :deploy_via,          :filtered_remote_cache
set :repository_cache,    "/var/cache/engineyard/#{application}"

set :monit_group,         "africa"
set :scm,                 :subversion
set :runner,              "africa"


set :production_database, "africa_production"
set :production_dbhost,   "mysql50-1-master"









set :dbuser,        "africa_db"
set :dbpass,        "LitVihie"

# comment out if it gives you trouble. newest net/ssh needs this set.
ssh_options[:paranoid] = false


# =============================================================================
# ROLES
# =============================================================================
# You can define any number of roles, each of which contains any number of
# machines. Roles might include such things as :web, or :app, or :db, defining
# what the purpose of each machine is. You can also specify options that can
# be used to single out a specific subset of boxes in a particular role, like
# :primary => true.



task :production do

  role :web, "65.74.174.196:8475" # africa [mongrel] [mysql50-1-master]
  role :app, "65.74.174.196:8475", :mongrel => true
  role :db , "65.74.174.196:8475", :primary => true


  set :rails_env, "production"
  set :environment_database, defer { production_database }
  set :environment_dbhost, defer { production_dbhost }
end



















# =============================================================================
# Any custom after tasks can go here.
# after "deploy:symlink_configs", "africa_custom"
# task :africa_custom, :roles => :app, :except => {:no_release => true, :no_symlink => true} do
#   run <<-CMD
#   CMD
# end
# =============================================================================

# Do not change below unless you know what you are doing!

after "deploy", "deploy:cleanup"
after "deploy:migrations" , "deploy:cleanup"
after "deploy:update_code", "deploy:symlink_configs"

# uncomment the following to have a database backup done before every migration
# before "deploy:migrate", "db:dump"

