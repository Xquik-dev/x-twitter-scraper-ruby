# frozen_string_literal: true

module XTwitterScraper
  module Models
    class Error < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute error
      #
      #   @return [Symbol, XTwitterScraper::Models::Error::Error]
      required :error, enum: -> { XTwitterScraper::Error::Error }

      # @!method initialize(error:)
      #   Error response containing a machine-readable error code.
      #
      #   @param error [Symbol, XTwitterScraper::Models::Error::Error]

      # @see XTwitterScraper::Models::Error#error
      module Error
        extend XTwitterScraper::Internal::Type::Enum

        INTERNAL_ERROR = :internal_error
        INVALID_FORMAT = :invalid_format
        INVALID_ID = :invalid_id
        INVALID_INPUT = :invalid_input
        INVALID_PARAMS = :invalid_params
        INVALID_TOOL_TYPE = :invalid_tool_type
        INVALID_TWEET_ID = :invalid_tweet_id
        INVALID_TWEET_URL = :invalid_tweet_url
        INVALID_USERNAME = :invalid_username
        INSUFFICIENT_CREDITS = :insufficient_credits
        MISSING_PARAMS = :missing_params
        MISSING_QUERY = :missing_query
        MONITOR_ALREADY_EXISTS = :monitor_already_exists
        MONITOR_LIMIT_REACHED = :monitor_limit_reached
        NO_CREDITS = :no_credits
        NO_SUBSCRIPTION = :no_subscription
        NOT_FOUND = :not_found
        SUBSCRIPTION_INACTIVE = :subscription_inactive
        TWEET_NOT_FOUND = :tweet_not_found
        UNAUTHENTICATED = :unauthenticated
        UNSUPPORTED_FIELD = :unsupported_field
        USER_NOT_FOUND = :user_not_found
        WEBHOOK_INACTIVE = :webhook_inactive
        X_API_RATE_LIMITED = :x_api_rate_limited
        X_API_UNAVAILABLE = :x_api_unavailable
        X_API_UNAUTHORIZED = :x_api_unauthorized

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
