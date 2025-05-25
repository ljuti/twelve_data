module TwelveData
  module Api
    class Core
      def initialize(client)
        @_client = client
      end

      def time_series(symbol, params = {})
        params[:symbol] = symbol
        @_client.connection.get("/time_series", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def quote(symbol, params = {})
        params[:symbol] = symbol
        @_client.connection.get("/quote", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def price(symbol, params = {})
        params[:symbol] = symbol
        @_client.connection.get("/price", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end
    end
  end
end