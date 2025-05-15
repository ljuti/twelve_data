module TwelveData
  module Api
    class Etf
      def initialize(client)
        @_client = client
      end

      def data(symbol, params = {})
        params[:symbol] = symbol
        @_client.get("/etfs/world", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def summary(symbol, params = {})
        params[:symbol] = symbol
        @_client.get("/etfs/world/summary", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def performance(symbol, params = {})
        params[:symbol] = symbol
        @_client.get("/etfs/world/performance", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def composition(symbol, params = {})
        params[:symbol] = symbol
        @_client.get("/etfs/world/composition", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end
    end
  end
end