require "dry/struct"

module TwelveData
  module Api
    class Stock < Dry::Struct
      transform_keys(&:to_sym)

      attribute :symbol, Types::String
      attribute :name, Types::String
      attribute :exchange, Types::String
      attribute :mic_code, Types::String
      attribute :currency, Types::String
      attribute :type, Types::String
      attribute :country, Types::String
      attribute :figi_code, Types::String.optional
      attribute :cfi_code, Types::String.optional
    end
  end
end