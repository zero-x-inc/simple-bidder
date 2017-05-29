require 'mixlib/config'

module Config
  extend Mixlib::Config
  config_strict_mode true
  default :environment, ENV['RACK_ENV'] || ENV['RAILS_ENV'] || 'development'

  config_context :puma do
    default :bind, ENV['PUMA_BIND'] || 'tcp://0.0.0.0:9292'
  end

  config_context :tranquility do
    default :uri, ENV['TRANQUILITY_URI'] || 'http://127.0.0.1:8200/v1/post/events-v1'
  end
end
