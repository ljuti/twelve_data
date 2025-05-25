require "dry/types"

module Types
  include Dry.Types()

  TimeStringToSeconds = Types::Integer.constructor do |value|
    case value
    when String
      h, m, s = value.split(":").map(&:to_i)
      h * 3600 + m * 60 + s
    when Integer
      value
    else
      0
    end
  end
end

require_relative "api/batch"
require_relative "api/core"
require_relative "api/error"
require_relative "api/etf"
require_relative "api/fundamental"
require_relative "api/indicators"
require_relative "api/websocket"
require_relative "api/reference"
require_relative "api/commodity"
require_relative "api/market"
require_relative "api/stock"
