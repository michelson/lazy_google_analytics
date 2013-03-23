module LazyGoogleAnalytics
  class Client

    CLIENT_OPTIONS = %w(api_method parameters ids start_date end_date dimensions metrics sort filters)
    attr_accessor :options, :config, :auth


    def initialize(config, auth, opts = {})

      @config = config
      @auth   = auth

      self.tap do |client|
        client.options    ||= {}
        client.defaults_options(opts)
        client.options ||= opts
        yield client if block_given?
      end
    end

    def defaults_options(opts)
      @api_method = opts[:api_method] ||= @auth.analytics.data.ga.get
      ids        = opts[:ids]        ||= "ga:#{@config.profile_id}"
      start_date = opts[:start_date] ||= DateTime.now.prev_month.strftime("%Y-%m-%d")
      end_date   = opts[:end_date]   ||= DateTime.now.strftime("%Y-%m-%d")

      self.api_method(@auth.analytics.data.ga.get)
      self.parameters({'ids' => "ga:#{@config.profile_id}",
                      'start-date' => start_date,
                      'end-date' => end_date,
                      'dimensions' => "ga:day,ga:month",
                      'metrics' => "ga:visits",
                      'sort' => "ga:month,ga:day" })

    end


    def results
      @results = @auth.client.execute(@options)
    end

    def formatted_columns

      (@results || self.results).data.column_headers.map { |c|
        c.name
      }.join("\t")
    end

    def formatted_rows
      (@results || self.results).data.rows.each do |r|
        print r.join("\t"), "\n"
      end
    end

    def method_missing(meth, opts = {})
      merge_options meth, opts
    end

  private

    def merge_options(name, opts)
      @options.merge!  name => opts
    end

    def deep_merge_options(name, opts)
      @options.deep_merge!  name => opts
    end

    def arguments_to_options(args)
      if args.blank?
        {:show => true}
      elsif args.is_a? Array
        args.first
      else
        args
      end
    end


  end
end


