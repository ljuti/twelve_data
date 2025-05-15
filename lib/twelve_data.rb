# frozen_string_literal: true

require_relative "twelve_data/api"
require_relative "twelve_data/client"
require_relative "twelve_data/config"
require_relative "twelve_data/version"

module TwelveData
  class Error < StandardError; end
end
