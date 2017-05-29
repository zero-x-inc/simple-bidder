ENV['BUNDLE_GEMFILE'] ||= File.expand_path('./Gemfile', __FILE__)

require 'bundler/setup' # Set up gems listed in the Gemfile.
require 'sinatra/contrib'
require 'json'
require 'logger'
require 'date'
require 'active_model'
require 'active_support'
require 'active_support/core_ext'
require 'active_support/all'
require './config/config'

Bundler.require(:default, ENV['RACK_ENV'] || 'development')

require_all './lib'
