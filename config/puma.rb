require './config/config'

environment Config.environment
daemonize false
pidfile './tmp/pids/puma.pid'
state_path './tmp/pids/puma.state'
bind Config.puma.bind
rackup DefaultRackup
threads 1,1
workers 1
preload_app!
