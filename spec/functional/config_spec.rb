require File.expand_path(File.dirname(__FILE__) + '../../spec_helper')

describe "Config" do
  before(:all) do
    @config = LazyGoogleAnalytics::Config.new(config_options)

    @config2 = LazyGoogleAnalytics::Config.new({
      :pass_phrase => "notasecret"
    })
  end

  it "has all the keys required" do
    @config.pass_phrase.should_not be_empty
    @config.key_file.should_not be_empty
    @config.scope.should_not be_empty
    @config.profile_id.should_not be_empty
    @config.email.should_not be_empty
  end

  it "config should be valid" do
    pending
    @config.has_required_keys?.should be true
  end

  it "failed config should raise an error" do
    pending
    @config.has_required_keys?.should be LazyGoogleAnalytics::Config::WrongConfig
  end

end
