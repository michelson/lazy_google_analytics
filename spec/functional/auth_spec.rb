require File.expand_path(File.dirname(__FILE__) + '../../spec_helper')

describe "Config" do
  before(:all) do
    @config = LazyGoogleAnalytics::Config.new(config_options)
    @auth   = LazyGoogleAnalytics::Auth.new(@config)
  end

  it "authorization object" do
    @auth.authorize
    @auth.analytics.class.should be Google::APIClient::API
  end

end






