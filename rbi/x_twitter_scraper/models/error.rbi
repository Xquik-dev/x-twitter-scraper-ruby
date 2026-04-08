# typed: strong

module XTwitterScraper
  module Models
    class Error < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(XTwitterScraper::Error, XTwitterScraper::Internal::AnyHash)
        end

      sig { returns(XTwitterScraper::Error::Error::OrSymbol) }
      attr_accessor :error

      # Error response containing a machine-readable error code.
      sig do
        params(error: XTwitterScraper::Error::Error::OrSymbol).returns(
          T.attached_class
        )
      end
      def self.new(error:)
      end

      sig do
        override.returns({ error: XTwitterScraper::Error::Error::OrSymbol })
      end
      def to_hash
      end

      module Error
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, XTwitterScraper::Error::Error) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INTERNAL_ERROR =
          T.let(:internal_error, XTwitterScraper::Error::Error::TaggedSymbol)
        INVALID_FORMAT =
          T.let(:invalid_format, XTwitterScraper::Error::Error::TaggedSymbol)
        INVALID_ID =
          T.let(:invalid_id, XTwitterScraper::Error::Error::TaggedSymbol)
        INVALID_INPUT =
          T.let(:invalid_input, XTwitterScraper::Error::Error::TaggedSymbol)
        INVALID_PARAMS =
          T.let(:invalid_params, XTwitterScraper::Error::Error::TaggedSymbol)
        INVALID_TOOL_TYPE =
          T.let(:invalid_tool_type, XTwitterScraper::Error::Error::TaggedSymbol)
        INVALID_TWEET_ID =
          T.let(:invalid_tweet_id, XTwitterScraper::Error::Error::TaggedSymbol)
        INVALID_TWEET_URL =
          T.let(:invalid_tweet_url, XTwitterScraper::Error::Error::TaggedSymbol)
        INVALID_USERNAME =
          T.let(:invalid_username, XTwitterScraper::Error::Error::TaggedSymbol)
        MISSING_PARAMS =
          T.let(:missing_params, XTwitterScraper::Error::Error::TaggedSymbol)
        MISSING_QUERY =
          T.let(:missing_query, XTwitterScraper::Error::Error::TaggedSymbol)
        MONITOR_ALREADY_EXISTS =
          T.let(
            :monitor_already_exists,
            XTwitterScraper::Error::Error::TaggedSymbol
          )
        MONITOR_LIMIT_REACHED =
          T.let(
            :monitor_limit_reached,
            XTwitterScraper::Error::Error::TaggedSymbol
          )
        NO_SUBSCRIPTION =
          T.let(:no_subscription, XTwitterScraper::Error::Error::TaggedSymbol)
        NOT_FOUND =
          T.let(:not_found, XTwitterScraper::Error::Error::TaggedSymbol)
        STREAM_REGISTRATION_FAILED =
          T.let(
            :stream_registration_failed,
            XTwitterScraper::Error::Error::TaggedSymbol
          )
        SUBSCRIPTION_INACTIVE =
          T.let(
            :subscription_inactive,
            XTwitterScraper::Error::Error::TaggedSymbol
          )
        TWEET_NOT_FOUND =
          T.let(:tweet_not_found, XTwitterScraper::Error::Error::TaggedSymbol)
        UNAUTHENTICATED =
          T.let(:unauthenticated, XTwitterScraper::Error::Error::TaggedSymbol)
        USAGE_LIMIT_REACHED =
          T.let(
            :usage_limit_reached,
            XTwitterScraper::Error::Error::TaggedSymbol
          )
        USER_NOT_FOUND =
          T.let(:user_not_found, XTwitterScraper::Error::Error::TaggedSymbol)
        WEBHOOK_INACTIVE =
          T.let(:webhook_inactive, XTwitterScraper::Error::Error::TaggedSymbol)
        X_API_RATE_LIMITED =
          T.let(
            :x_api_rate_limited,
            XTwitterScraper::Error::Error::TaggedSymbol
          )
        X_API_UNAVAILABLE =
          T.let(:x_api_unavailable, XTwitterScraper::Error::Error::TaggedSymbol)
        X_API_UNAUTHORIZED =
          T.let(
            :x_api_unauthorized,
            XTwitterScraper::Error::Error::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[XTwitterScraper::Error::Error::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
