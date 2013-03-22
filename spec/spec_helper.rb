$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'debugger'
require File.join(File.dirname(__FILE__), '../lib', 'lazy_google_analytics')
require 'stringio'
require "pry"

RSpec.configure do |config|

  def fixture_key(type, filename)
    dir_name = type.to_s + "s"
    File.dirname(__FILE__) + "/fixtures/#{dir_name}/#{filename}"
  end

  def config_options
    config = YAML.load( File.open(fixture_key("config", "account_config.yml")) )
    config["key_file"]  = fixture_key("key", config["pem"])
    return config
  end

end
