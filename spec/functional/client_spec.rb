require File.expand_path(File.dirname(__FILE__) + '../../spec_helper')


describe "errors" do
  before :each do
    config_setup
    @error_report = LazyGoogleAnalytics::Client.new()
    @error_report.parameters({'ids' => "ga:#{LazyGoogleAnalytics::Config.profile_id}",
                      'start-date' => DateTime.now.prev_month.strftime("%Y-%m-%d"),
                      'end-date' => DateTime.now.strftime("%Y-%m-%d"),
                      'dimensions' => "ga:year,ga:month",
                      'metrics' => "ga:visits,ga:bounces,ga:entranceBounceRate",
                      'sort' => "ga:month,ga:day" })

  end

  it "should raise and error" do
    lambda { @error_report.results }.should raise_error
  end
end

describe "Client" do
  before(:all) do
    config_setup
    @client = LazyGoogleAnalytics::Client.new()
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


