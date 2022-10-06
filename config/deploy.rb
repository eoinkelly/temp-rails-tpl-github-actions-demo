# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"

##
# Uncomment and configure this block if your deployments go through a
# bastion/jump host.
#
# CAP_BASTION_USER = "deploy".freeze
# CAP_BASTION_HOST = "some-ip-or-hostname".freeze
# set :ssh_options, {
#   proxy: Net::SSH::Proxy::Command.new("ssh -o StrictHostKeyChecking=no #{CAP_BASTION_USER}@#{CAP_BASTION_HOST} -W %h:%p")
# }

set :application, "TODO_set_app_name"
set :repo_url, "git://example.com/foo"

set :bundle_config, {
  deployment: true,
  without: "development:test"
}

# Default value for :linked_files is []
append :linked_files, ".env"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "storage"

##
# Roles
#
# We have a single :app role which contains all the servers we care about in
# this deployment.
#
# We run nginx, rails on the same servers so we do not need the distinction
# between the :web and :app roles that Capistrano encourages by default.
#
# Capistrano is not involved at all in Database management so we don't need a
# separate :db role either
#
set :assets_roles, [:app] # defaults to [:web]
set :migration_role, :app # defaults to :db

# Default value for default_env is {}
set :default_env, path: "$HOME/.rbenv/shims:$HOME/bin:/snap/bin:$PATH"

set :rbenv_path, "$HOME/.rbenv"
# set :rbenv_type, :user # or :system, or :fullstaq (for Fullstaq Ruby), depends on your rbenv setup
set :rbenv_ruby, File.read(".ruby-version").strip
set :rbenv_prefix, "$HOME/.rbenv/bin/rbenv exec"
set :rbenv_map_bins, %w[rake gem bundle ruby rails]

namespace :deploy do
  desc "Restart application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :sudo, "systemctl restart puma"
      execute :sudo, "systemctl restart sidekiq"
    end
  end

  task :start do
    on roles(:app) do
      execute :sudo, "systemctl start puma"
      execute :sudo, "systemctl start sidekiq"
    end
  end

  task :stop do
    on roles(:app) do
      execute :sudo, "systemctl stop puma"
      execute :sudo, "systemctl stop sidekiq"
    end
  end

  task :status do
    on roles(:app) do
      execute :sudo, "systemctl status puma"
      execute :sudo, "systemctl status sidekiq"
    end
  end

  after :publishing, :restart
end

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", 'config/master.key'

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
