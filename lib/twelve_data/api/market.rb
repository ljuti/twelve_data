require "dry/struct"

module TwelveData
  module Api
    class Market < Dry::Struct
      transform_keys(&:to_sym)
      attribute :name, Types::String
      attribute :code, Types::String
      attribute :country, Types::String
      attribute :is_market_open, Types::Bool
      attribute :time_to_open, Types::TimeStringToSeconds
      attribute :time_to_close, Types::TimeStringToSeconds
      attribute :time_after_open, Types::TimeStringToSeconds
    end
  end
end