require File.expand_path(File.dirname(__FILE__) + '../../spec_helper')

describe "Client" do
  before(:all) do
    @config = LazyGoogleAnalytics::Config.new(config_options)
    @auth   = LazyGoogleAnalytics::Auth.new(@config)
    @auth.authorize
    @client = LazyGoogleAnalytics::Client.new({
                                              :config=>@config,
                                              :auth=>@auth,
                                              :client_options => {}
                                              })
  end

  it "find objects object" do
    #binding.pry
    @client.results
  end

end
