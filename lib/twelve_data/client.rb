module TwelveData
  class Client
    def initialize(config = Config.new)
      @_config = config
    end

    def config
      @_config ||= Config.new
    end

    def batch
      @_batch ||= Api::Batch.new(self)
    end

    def websocket
      @_websocket ||= Api::Websocket.new(self)
    end

    def core
      @_core ||= Api::Core.new(self)
    end

    def connection
      @connection = Faraday.new(url: config.api_url) do |conn|
        conn.request :json
        conn.request :retry, max: 3, interval: 0.05, backoff_factor: 2
        conn.response :json, content_type: /\bjson$/
        conn.adapter Faraday.default_adapter
        conn.headers["User-Agent"] = "TwelveData Ruby Gem #{TwelveData.gem_version}"
        conn.headers["Accept"] = "application/json"
        conn.headers["Content-Type"] = "application/json"
        conn.headers["Authorization"] = config.api_key
      end
    end
  end
end