# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'analytics-proxy'
set :repo_url, 'git@github.com:vidroll/analytics-proxy.git'
set :deploy_to, '/opt/analytics-proxy'

set :scm, :git
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :use_sudo, false

set :deploy_via, :copy

set :ssh_options, { :forward_agent => true }

set :pty, true

set :keep_releases, 5

set :rbenv_type, :user # or :system, depends on your rbenv setup

set :rbenv_ruby, File.read('.ruby-version').strip


# append :linked_files, 'config/database.yml', 'config/secrets.yml'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system'

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
