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

  def config_setup
    LazyGoogleAnalytics::Config.setup do |config|
      config.pass_phrase = config_options["pass_phrase"]
      config.key_file    = config_options["key_file"]
      config.client_id   = config_options["client_id"]
      config.scope       = config_options["scope"]
      config.profile_id  = config_options["profile_id"]
      config.email       =  config_options["email"]
    end
    LazyGoogleAnalytics::Config
  end

end
