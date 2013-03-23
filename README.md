# LazyGoogleAnalytics

Lazy google analytics for the lazy programmer. it´s an abstraction around google-analytics-client gem.

## Motivation

google-analytics-client gem is a very powerfull tool to access the api resources on google. but for me it was not very straightforward , so i come around with a simple way to implement it. thats all. Hope you like it.

## Installation

Add this line to your application's Gemfile:

    gem 'lazy_google_analytics'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lazy_google_analytics

## Simple Usage

  setup options:

    LazyGoogleAnalytics::Config.setup do |config|
      config.pass_phrase = "notasecret"
      config.key_file    = /location/to_your/key_file.p12
      config.client_id   = "XXXXX.apps.googleusercontent.com"
      config.scope       = "https://www.googleapis.com/auth/analytics.readonly"
      config.profile_id  = "XXXXX"
      config.email       = "XXXXXX@developer.gserviceaccount.com"
    end

  api calls:

    @client = LazyGoogleAnalytics::Client.new()

  By default LazyGoogleAnalytics::Client is going to make a call for visits within 1 month timeline sorted by month & day, using the profile in config block.

  But you can extend that behavior passing and entire options_hash with specific parameters:

    @client = LazyGoogleAnalytics::Client.new()
    @client.parameters({'ids' => "ga:XXXXX",
                      'start-date' => "2013-03-12",
                      'end-date' => "2013-04-12",
                      'dimensions' => "ga:day,ga:month",
                      'metrics' => "ga:visits",
                      'sort' => "ga:month,ga:day" })

## Rails 3

  installs configuration initializer

    rails g lazy_google_analytics:install

## GA How to:

If you follow this simple steps , you can´t fail.

  + First, you have to register your api access in: [google api console](https://code.google.com/apis/console/) and create a server key.
  + Download the p12 key.
  + Add the created @developer.gserviceaccount.com to your users list in the analytics user panel.
  + Configure options based on server key and analytics profile id, not the (UA-something) account id!

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

