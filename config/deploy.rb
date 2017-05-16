# config valid only for current version of Capistrano
lock "3.8.1"

server 'wangliang01.rnd.laxino.com', roles: [:app, :db, :web], primary: true

set :application, "blog"
set :user,     'laxino'
set :repo_url, "git@github.com:MofiU/blog.git"
set :rvm_ruby_version, '2.3.1@rails5'

set :use_sudo,        false
set :stage,           :production
set :deploy_to,       "/opt/deploy/#{fetch(:user)}/apps/#{fetch(:application)}"


# PUMA
# set :puma_state, "#{shared_path}/tmp/pids/puma.state"
# set :puma_pid,   "#{shared_path}/tmp/pids/puma.pid"
# set :puma_bind, "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}/puma.sock"
# set :puma_conf, "#{shared_path}/puma.rb"
# set :puma_access_log, "#{shared_path}/log/puma_error.log"
# set :puma_error_log, "#{shared_path}/log/puma_access.log"
# set :puma_role, :app
# set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
# set :puma_threads, [0, 16]
# set :puma_workers, 0
set :puma_init_active_record, true
# set :puma_preload_app, true


# set :nginx_config_name, "#{fetch(:application)}_#{fetch(:stage)}"
# set :nginx_flags, 'fail_timeout=0'
# set :nginx_http_flags, fetch(:nginx_flags)
# set :nginx_server_name, "localhost #{fetch(:application)}.local"
# set :nginx_sites_available_path, '/etc/nginx/sites-available'
# set :nginx_sites_enabled_path, '/etc/nginx/sites-enabled'
# set :nginx_socket_flags, fetch(:nginx_flags)
# set :nginx_ssl_certificate, "/etc/ssl/certs/{fetch(:nginx_config_name)}.crt"
# set :nginx_ssl_certificate_key, "/etc/ssl/private/{fetch(:nginx_config_name)}.key"
# set :nginx_use_ssl, false

set :migration_role, :db
set :migration_servers, -> { primary(fetch(:migration_role)) }
set :conditionally_migrate, true

set :assets_roles, [:app]
# set :assets_prefix, 'blog-assets' # config.assets.prefix = "/blog-assets"
# set :normalize_asset_timestamps, %w{public/images public/javascripts public/stylesheets}

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "#app_{stage}"


# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 2

after 'deploy:publishing', 'deploy:restart'