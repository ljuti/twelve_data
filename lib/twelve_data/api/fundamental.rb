module TwelveData
  module Api
    class Fundamental
      def initialize(client)
        @_client = client
      end

      def profile(symbol, params = {})
        params[:symbol] = symbol
        @_client.get("/profile", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def dividends(symbol, params = {})
        params[:symbol] = symbol
        @_client.get("/dividends", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def dividends_calendar(symbol, params = {})
        params[:symbol] = symbol
        @_client.get("/dividends_calendar", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def earnings(symbol, params = {})
        params[:symbol] = symbol
        @_client.get("/earnings", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def earnings_calendar(symbol, params = {})
        params[:symbol] = symbol
        @_client.get("/earnings_calendar", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def statistics(symbol, params = {})
        params[:symbol] = symbol
        @_client.get("/statistics", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def income_statement(symbol, params = {})
        params[:symbol] = symbol
        @_client.get("/income_statement", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def income_statement_consolidated(symbol, params = {})
        params[:symbol] = symbol
        @_client.get("/income_statement/consolidated", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def balance_sheet(symbol, params = {})
        params[:symbol] = symbol
        @_client.get("/balance_sheet", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def balance_sheet_consolidated(symbol, params = {})
        params[:symbol] = symbol
        @_client.get("/balance_sheet/consolidated", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def cash_flow(symbol, params = {})
        params[:symbol] = symbol
        @_client.get("/cash_flow", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def cash_flow_consolidated(symbol, params = {})
        params[:symbol] = symbol
        @_client.get("/cash_flow/consolidated", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def executives(symbol, params = {})
        params[:symbol] = symbol
        @_client.get("/key_executives", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end

      def market_cap(symbol, params = {})
        params[:symbol] = symbol
        @_client.get("/market_cap", params).tap do |response|
          raise Api::Error.new(response.status, response.body) unless response.success?
          return response.body
        end
      end
    end
  end
end