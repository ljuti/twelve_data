require "anyway_config"

module TwelveData
  class Config < Anyway::Config
    attr_config :api_key
    attr_config :api_url, default: "https://api.twelvedata.com"
    attr_config :ws_url, default: "wss://ws.twelvedata.com"
  end
end