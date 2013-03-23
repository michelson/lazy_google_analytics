require File.expand_path(File.dirname(__FILE__) + '../../spec_helper')

describe "Client" do
  before(:all) do
    @config = LazyGoogleAnalytics::Config.new(config_options)
    @auth   = LazyGoogleAnalytics::Auth.new(@config)
    @auth.authorize
    @client = LazyGoogleAnalytics::Client.new(@config, @auth )
  end

  it "find objects object" do
    @client.results
  end

  it "headers" do
    @client.formatted_columns.should == "ga:day\tga:month\tga:visits"
  end

  it "rows" do
    @client.formatted_rows.class.should == Array
    @client.formatted_rows.should_not be_empty
  end

end
