ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __FILE__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'sinatra/activerecord/rake'

namespace :db do
  task :load_config do
    require './app'
  end
end
