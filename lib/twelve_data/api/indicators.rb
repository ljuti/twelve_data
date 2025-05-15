module TwelveData
  module Api
    class Indicators
      def initialize(client)
        @_client = client
      end

      def ema(symbol, params = {})
        params[:symbol] = symbol
        @_client.get("/ema", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def macd(symbol, params = {})
        params[:symbol] = symbol
        @_client.get("/macd", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def rsi(symbol, params = {})
        params[:symbol] = symbol
        @_client.get("/rsi", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def sma(symbol, params = {})
        params[:symbol] = symbol
        @_client.get("/sma", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def vwap(symbol, params = {})
        params[:symbol] = symbol
        @_client.get("/vwap", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def wma(symbol, params = {})
        params[:symbol] = symbol
        @_client.get("/wma", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end
    end
  end
end