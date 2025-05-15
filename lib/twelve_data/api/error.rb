module TwelveData
  module Api
    class Error < StandardError
      attr_reader :code, :message

      def initialize(code, message)
        @code = code
        @message = message
        super(message)
      end

      def to_s
        "#{code}: #{message}"
      end
    end

    class InvalidApiKeyError < Error; end
    class UnauthorizedError < Error; end
    class ForbiddenError < Error; end
    class RateLimitExceededError < Error; end
    class ParameterTooLongError < Error; end
    class InvalidRequestError < Error; end
    class NotFoundError < Error; end
    class InternalServerError < Error;
  end
end