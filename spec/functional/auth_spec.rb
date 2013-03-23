require File.expand_path(File.dirname(__FILE__) + '../../spec_helper')

describe "Config" do
  before(:all) do
    config_setup
    @auth = LazyGoogleAnalytics::Auth.new
  end

  it "authorization object" do
    @auth.authorize
    @auth.analytics.class.should be Google::APIClient::API
  end

end






