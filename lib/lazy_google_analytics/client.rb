module LazyGoogleAnalytics
  class Client

    def initialize(opts = {})
      @config = opts[:config]
      @auth   = opts[:auth]

      @api_method = opts[:client_options][:api_method] ||= @auth.analytics.data.ga.get
      @ids = opts[:client_options][:ids] ||= "ga:#{@config.profile_id}"
      @start_date = opts[:client_options][:start_date] ||= DateTime.now.prev_month.strftime("%Y-%m-%d")
      @end_date = opts[:client_options][:end_date] ||= DateTime.now.strftime("%Y-%m-%d")
      @dimensions = opts[:client_options][:dimensions] ||= "ga:day,ga:month"
      @metrics = opts[:client_options][:metrics] ||= "ga:visits"
      @sort = opts[:client_options][:sort] ||= "ga:month,ga:day"

    end


    def results

      startDate = DateTime.now.prev_month.strftime("%Y-%m-%d")
      endDate = DateTime.now.strftime("%Y-%m-%d")

      options = { :api_method => @api_method,
                  :parameters => {'ids' => @ids,
                                  'start-date' => @start_date,
                                  'end-date' => @end_date,
                                  'dimensions' => @dimensions,
                                  'metrics' => @metrics,
                                  'sort' => @sort }
                }

      @results = @auth.client.execute( options)

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

  end
end


