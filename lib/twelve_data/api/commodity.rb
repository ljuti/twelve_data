require "dry/struct"

module TwelveData
  module Api
    class Commodity < Dry::Struct
      transform_keys(&:to_sym)

      attribute :symbol, Types::String
      attribute :name, Types::String
      attribute :category, Types::String
    end
  end
end