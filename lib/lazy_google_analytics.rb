
$:.unshift(File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "google/api_client"

module LazyGoogleAnalytics

  autoload  :VERSION,  'lazy_google_analytics/version.rb'
  autoload  :Config,   'lazy_google_analytics/config.rb'
  autoload  :Auth,     'lazy_google_analytics/auth.rb'
  autoload  :Client,   'lazy_google_analytics/client.rb'

  if defined?(::Rails::Railtie)
    require File.join(File.dirname(__FILE__), *%w[lazy_google_analytics railtie])
    require File.join(File.dirname(__FILE__), *%w[lazy_google_analytics engine]) if ::Rails.version >= '3.1'
  end

end
