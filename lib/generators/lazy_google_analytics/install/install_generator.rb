# encoding: UTF-8

module LazyGoogleAnalytics
  class InstallGenerator < ::Rails::Generators::Base

    source_root File.expand_path("../../../templates", __FILE__)

    desc "Creates a Lazy-Google-Analytics initializer."
    #class_option :orm

    def copy_initializer
      say_status("installing", "Lazy google analytics", :green)
      copy_file "lazy_google_analytics.rb.erb", "config/initializers/lazy_google_analytics.rb"
    end

    def show_readme
      readme "README" if behavior == :invoke
    end

  end
end
