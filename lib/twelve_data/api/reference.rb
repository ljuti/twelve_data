module TwelveData
  module Api
    class Reference
      def initialize(client)
        @_client = client
      end

      def stocks(params = {})
        @_client.connection.get("/stocks", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body["data"].map {|object| Api::Stock.new(object) }
        end
      end

      def funds(params = {})
        @_client.connection.get("/funds", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def bonds(params = {})
        @_client.connection.get("/bonds", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def forex(params = {})
        @_client.connection.get("/forex_pairs", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def etfs(params = {})
        @_client.connection.get("/etfs", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          # return response.body["data"].map {|object| Api::Etf.new(object) }
          return response.body
        end
      end

      def commodities(params = {})
        @_client.connection.get("/commodities", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body["data"].map {|object| Api::Commodity.new(object) }
        end
      end

      def markets(params = {})
        @_client.connection.get("/market_state", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body.map {|object| Api::Market.new(object) }
        end
      end
    end
  end
end