module LazyGoogleAnalytics
  class Config

    class WrongConfig < StandardError; end

    def initialize(data={})
      @data = {}
      update!(data)
    end

    def update!(data)
      data.each do |key, value|
        self[key] = value
      end
    end

    def [](key)
      @data[key.to_sym]
    end

    def []=(key, value)
      if value.class == Hash
        @data[key.to_sym] = LazyGoogleAnalytics::Config.new(value)
      else
        @data[key.to_sym] = value
      end
    end

    def method_missing(sym, *args)
      if sym.to_s =~ /(.+)=$/
        self[$1] = args.first
      else
        self[sym]
      end
    end

    def has_required_keys?
      res = @data.keys - [:pass_phrase, :key_file, :client_id, :scope, :profile_id, :email]
      raise LazyGoogleAnalytics::Config::WrongConfig unless res.empty?
    end

  end
end