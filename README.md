# LazyGoogleAnalytics

Lazy google analytics it´s an abstraction around [google-api-client](http://code.google.com/p/google-api-ruby-client/) gem, to make server to server api calls.

## Motivation

[google-api-client](http://code.google.com/p/google-api-ruby-client/) gem is a very powerfull tool to access the api resources on google. but for me it was not very straightforward, so I come around with a simple way to implement it. that's all.

Hope you like it.

## Installation

Add this line to your application's Gemfile:

    gem 'lazy_google_analytics'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lazy_google_analytics

## Simple Usage

### Configuration setup:

    LazyGoogleAnalytics::Config.setup do |config|
      config.pass_phrase = "notasecret"
      config.key_file    = /location/to_your/key_file.p12
      config.client_id   = "XXXXX.apps.googleusercontent.com"
      config.scope       = "https://www.googleapis.com/auth/analytics.readonly"
      config.profile_id  = "XXXXX"
      config.email       = "XXXXXX@developer.gserviceaccount.com"
    end

### Api calls:

    @client = LazyGoogleAnalytics::Client.new()

  By default LazyGoogleAnalytics::Client is going to make a call for visits within 1 month timeline sorted by month & day, using the profile_id in config block.

  But you can override specific parameters like this:

    @client = LazyGoogleAnalytics::Client.new({:ids => "ga:123456"})

  Also you can extend the options after initialization, passing and entire options_hash overriding all default parameters:

    @client = LazyGoogleAnalytics::Client.new()
    @client.parameters({'ids' => "ga:XXXXX",
                      'start-date' => "2013-03-12",
                      'end-date' => "2013-04-12",
                      'dimensions' => "ga:day,ga:month",
                      'metrics' => "ga:visits",
                      'sort' => "ga:month,ga:day" })

#### Results

  To get the results of the initialized client you have to call .results method

    @results = @client.results
    @results.columns
    @results.rows

  Also this class have 2 convenience methods to output data:

  To get the queried columns:

    @results.formatted_columns

  To get the rows:

    @results.formatted_rows


## Rails 3

  Installs configuration initializer

    rails g lazy_google_analytics:install

## Google Analytics How to:

If you follow this simple steps , you can´t fail.

  + First, you have to register your api access in: [google api console](https://code.google.com/apis/console/) and create a server key.
  + Download the p12 key.
  + Add the created @developer.gserviceaccount.com to your users list in the analytics .user panel of the profile you want to retrieve the data, otherwise it wont work.
  + Note that the profile_id of the configuration object is not the UA-XXXXX number , is the Google Analytics profile number.
  + To play with the api to tests different options (without write any code) you can use [Google Analytics Query Explorer 2](https://ga-dev-tools.appspot.com/explorer/).
  + And last but not least [google analytics documentation](https://developers.google.com/analytics/).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


Copyright (c) 2013 miguel michelson, released under the MIT license

