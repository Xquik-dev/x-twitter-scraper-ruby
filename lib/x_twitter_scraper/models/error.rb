# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class Error < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute error
      #
      #   @return [Symbol, XTwitterScraper::Models::Error::Error::LegacyErrorCode, XTwitterScraper::Models::Error::Error::StructuredError]
      required :error, union: -> { XTwitterScraper::Error::Error }

      # @!attribute message
      #   Human-readable error guidance.
      #
      #   @return [String, nil]
      optional :message, String

      # @!attribute reason
      #   Machine-readable reason for a login cooldown.
      #
      #   @return [String, nil]
      optional :reason, String

      # @!attribute retry_after
      #   Seconds until the next permitted request.
      #
      #   @return [Integer, nil]
      optional :retry_after, Integer, api_name: :retryAfter

      # @!attribute retry_after_ms
      #   Required wait in milliseconds.
      #
      #   @return [Integer, nil]
      optional :retry_after_ms, Integer, api_name: :retryAfterMs

      # @!method initialize(error:, message: nil, reason: nil, retry_after: nil, retry_after_ms: nil)
      #   Error response. Default v1 returns a legacy string error code. Send
      #   `xquik-api-contract: 2026-04-29` to receive the structured best-practice error
      #   object.
      #
      #   @param error [Symbol, XTwitterScraper::Models::Error::Error::LegacyErrorCode, XTwitterScraper::Models::Error::Error::StructuredError]
      #
      #   @param message [String] Human-readable error guidance.
      #
      #   @param reason [String] Machine-readable reason for a login cooldown.
      #
      #   @param retry_after [Integer] Seconds until the next permitted request.
      #
      #   @param retry_after_ms [Integer] Required wait in milliseconds.

      # @see XTwitterScraper::Models::Error#error
      module Error
        extend XTwitterScraper::Internal::Type::Union

        variant enum: -> { XTwitterScraper::Error::Error::LegacyErrorCode }

        variant -> { XTwitterScraper::Error::Error::StructuredError }

        module LegacyErrorCode
          extend XTwitterScraper::Internal::Type::Enum

          INTERNAL_ERROR = :internal_error
          ACCOUNT_ALREADY_CONNECTED = :account_already_connected
          ACCOUNT_NEEDS_REAUTH = :account_needs_reauth
          ACCOUNT_NOT_FOUND = :account_not_found
          ACCOUNT_REQUIRED = :account_required
          ACCOUNT_RESTRICTED = :account_restricted
          API_KEY_LIMIT_REACHED = :api_key_limit_reached
          ARTICLE_NOT_FOUND = :article_not_found
          DM_NOT_PERMITTED = :dm_not_permitted
          INVALID_FORMAT = :invalid_format
          INVALID_ID = :invalid_id
          INVALID_INPUT = :invalid_input
          INVALID_PARAMS = :invalid_params
          INVALID_TOOL_TYPE = :invalid_tool_type
          INVALID_TWEET_ID = :invalid_tweet_id
          INVALID_TWEET_URL = :invalid_tweet_url
          INVALID_USER_ID = :invalid_user_id
          INVALID_USER_IDS = :invalid_user_ids
          INVALID_USERNAME = :invalid_username
          INVALID_JSON = :invalid_json
          INSUFFICIENT_CREDITS = :insufficient_credits
          LOGIN_COOLDOWN = :login_cooldown
          LOGIN_FAILED = :login_failed
          MEDIA_DOWNLOAD_FAILED = :media_download_failed
          MISSING_PARAMS = :missing_params
          MISSING_QUERY = :missing_query
          MONITOR_ALREADY_EXISTS = :monitor_already_exists
          NO_MEDIA = :no_media
          NO_CREDITS = :no_credits
          NO_SUBSCRIPTION = :no_subscription
          NOT_FOUND = :not_found
          PAYMENT_FAILED = :payment_failed
          RATE_LIMIT_EXCEEDED = :rate_limit_exceeded
          SERVICE_UNAVAILABLE = :service_unavailable
          STYLE_NOT_FOUND = :style_not_found
          SUBSCRIPTION_INACTIVE = :subscription_inactive
          TWEET_NOT_FOUND = :tweet_not_found
          UNAUTHENTICATED = :unauthenticated
          UNSUPPORTED_FIELD = :unsupported_field
          USER_NOT_FOUND = :user_not_found
          BODY_TOO_LARGE = :body_too_large
          CHECKOUT_UNAVAILABLE = :checkout_unavailable
          CONNECTION_CHALLENGE_EXPIRED = :connection_challenge_expired
          CONNECTION_CHALLENGE_INACTIVE = :connection_challenge_inactive
          DRAFT_NOT_FOUND = :draft_not_found
          FAVORITERS_UNAVAILABLE = :favoriters_unavailable
          FORBIDDEN = :forbidden
          GUEST_WALLET_UNAVAILABLE = :guest_wallet_unavailable
          GUEST_WALLETS_DISABLED = :guest_wallets_disabled
          GUEST_WALLETS_UNAVAILABLE = :guest_wallets_unavailable
          IDEMPOTENCY_CONFLICT = :idempotency_conflict
          IDEMPOTENCY_KEY_CONFLICT = :idempotency_key_conflict
          INVALID_COMMUNITY_ID = :invalid_community_id
          INVALID_IDEMPOTENCY_KEY = :invalid_idempotency_key
          INVALID_LIST_ID = :invalid_list_id
          INVALID_PAYMENT_AMOUNT = :invalid_payment_amount
          INVALID_RANGE = :invalid_range
          LOGIN_RATE_LIMITED = :login_rate_limited
          MISSING_IDEMPOTENCY_KEY = :missing_idempotency_key
          MISSING_IDS = :missing_ids
          NO_CACHED_STYLE = :no_cached_style
          PASSKEY_REQUIRED = :passkey_required
          RATE_LIMITED = :rate_limited
          READ_REQUEST_TIMEOUT = :read_request_timeout
          REPLIES_INCOMPLETE = :replies_incomplete
          SUPPORT_MEDIA_RATE_LIMIT = :support_media_rate_limit
          SUPPORT_REQUEST_RATE_LIMIT = :support_request_rate_limit
          TOO_MANY_IDS = :too_many_ids
          UNKNOWN_FIELD = :unknown_field
          UNSUPPORTED_MEDIA_TYPE = :unsupported_media_type
          WEBHOOK_INACTIVE = :webhook_inactive
          WRITE_TRACKING_UNAVAILABLE = :write_tracking_unavailable
          X_WRITE_UNCONFIRMED = :x_write_unconfirmed
          X_ACCOUNT_FEATURE_REQUIRED = :x_account_feature_required
          X_ACCOUNT_PROTECTED = :x_account_protected
          X_ACCOUNT_SUSPENDED = :x_account_suspended
          X_API_RATE_LIMITED = :x_api_rate_limited
          X_API_UNAVAILABLE = :x_api_unavailable
          X_API_UNAUTHORIZED = :x_api_unauthorized
          X_AUTH_FAILURE = :x_auth_failure
          X_CONTENT_TOO_LONG = :x_content_too_long
          X_DAILY_LIMIT = :x_daily_limit
          X_DM_NOT_ALLOWED = :x_dm_not_allowed
          X_DUPLICATE_ACTION = :x_duplicate_action
          X_LOGIN_AUTH_FAILED = :x_login_auth_failed
          X_LOGIN_CHALLENGE = :x_login_challenge
          X_LOGIN_DENIED = :x_login_denied
          X_LOGIN_FAILED = :x_login_failed
          X_LOGIN_PROXY_ERROR = :x_login_proxy_error
          X_LOGIN_RATE_LIMITED = :x_login_rate_limited
          X_LOGIN_SERVICE_UNAVAILABLE = :x_login_service_unavailable
          X_LOGIN_SUSPENDED = :x_login_suspended
          X_RATE_LIMITED = :x_rate_limited
          X_REJECTED = :x_rejected
          X_TARGET_NOT_FOUND = :x_target_not_found
          X_TRANSIENT_ERROR = :x_transient_error
          X_USER_LOOKUP_FAILED = :x_user_lookup_failed
          X_WRITE_AMBIGUOUS = :x_write_ambiguous
          X_WRITE_FAILED = :x_write_failed

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class StructuredError < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute code
          #
          #   @return [Symbol, XTwitterScraper::Models::Error::Error::StructuredError::Code]
          required :code, enum: -> { XTwitterScraper::Error::Error::StructuredError::Code }

          # @!attribute message
          #
          #   @return [String]
          required :message, String

          # @!attribute type
          #
          #   @return [Symbol, XTwitterScraper::Models::Error::Error::StructuredError::Type]
          required :type, enum: -> { XTwitterScraper::Error::Error::StructuredError::Type }

          # @!method initialize(code:, message:, type:)
          #   @param code [Symbol, XTwitterScraper::Models::Error::Error::StructuredError::Code]
          #   @param message [String]
          #   @param type [Symbol, XTwitterScraper::Models::Error::Error::StructuredError::Type]

          # @see XTwitterScraper::Models::Error::Error::StructuredError#code
          module Code
            extend XTwitterScraper::Internal::Type::Enum

            INTERNAL_ERROR = :internal_error
            ACCOUNT_ALREADY_CONNECTED = :account_already_connected
            ACCOUNT_NEEDS_REAUTH = :account_needs_reauth
            ACCOUNT_NOT_FOUND = :account_not_found
            ACCOUNT_REQUIRED = :account_required
            ACCOUNT_RESTRICTED = :account_restricted
            API_KEY_LIMIT_REACHED = :api_key_limit_reached
            ARTICLE_NOT_FOUND = :article_not_found
            DM_NOT_PERMITTED = :dm_not_permitted
            INVALID_FORMAT = :invalid_format
            INVALID_ID = :invalid_id
            INVALID_INPUT = :invalid_input
            INVALID_PARAMS = :invalid_params
            INVALID_TOOL_TYPE = :invalid_tool_type
            INVALID_TWEET_ID = :invalid_tweet_id
            INVALID_TWEET_URL = :invalid_tweet_url
            INVALID_USER_ID = :invalid_user_id
            INVALID_USER_IDS = :invalid_user_ids
            INVALID_USERNAME = :invalid_username
            INVALID_JSON = :invalid_json
            INSUFFICIENT_CREDITS = :insufficient_credits
            LOGIN_COOLDOWN = :login_cooldown
            LOGIN_FAILED = :login_failed
            MEDIA_DOWNLOAD_FAILED = :media_download_failed
            MISSING_PARAMS = :missing_params
            MISSING_QUERY = :missing_query
            MONITOR_ALREADY_EXISTS = :monitor_already_exists
            NO_MEDIA = :no_media
            NO_CREDITS = :no_credits
            NO_SUBSCRIPTION = :no_subscription
            NOT_FOUND = :not_found
            PAYMENT_FAILED = :payment_failed
            RATE_LIMIT_EXCEEDED = :rate_limit_exceeded
            SERVICE_UNAVAILABLE = :service_unavailable
            STYLE_NOT_FOUND = :style_not_found
            SUBSCRIPTION_INACTIVE = :subscription_inactive
            TWEET_NOT_FOUND = :tweet_not_found
            UNAUTHENTICATED = :unauthenticated
            UNSUPPORTED_FIELD = :unsupported_field
            USER_NOT_FOUND = :user_not_found
            BODY_TOO_LARGE = :body_too_large
            CHECKOUT_UNAVAILABLE = :checkout_unavailable
            CONNECTION_CHALLENGE_EXPIRED = :connection_challenge_expired
            CONNECTION_CHALLENGE_INACTIVE = :connection_challenge_inactive
            DRAFT_NOT_FOUND = :draft_not_found
            FAVORITERS_UNAVAILABLE = :favoriters_unavailable
            FORBIDDEN = :forbidden
            GUEST_WALLET_UNAVAILABLE = :guest_wallet_unavailable
            GUEST_WALLETS_DISABLED = :guest_wallets_disabled
            GUEST_WALLETS_UNAVAILABLE = :guest_wallets_unavailable
            IDEMPOTENCY_CONFLICT = :idempotency_conflict
            IDEMPOTENCY_KEY_CONFLICT = :idempotency_key_conflict
            INVALID_COMMUNITY_ID = :invalid_community_id
            INVALID_IDEMPOTENCY_KEY = :invalid_idempotency_key
            INVALID_LIST_ID = :invalid_list_id
            INVALID_PAYMENT_AMOUNT = :invalid_payment_amount
            INVALID_RANGE = :invalid_range
            LOGIN_RATE_LIMITED = :login_rate_limited
            MISSING_IDEMPOTENCY_KEY = :missing_idempotency_key
            MISSING_IDS = :missing_ids
            NO_CACHED_STYLE = :no_cached_style
            PASSKEY_REQUIRED = :passkey_required
            RATE_LIMITED = :rate_limited
            READ_REQUEST_TIMEOUT = :read_request_timeout
            REPLIES_INCOMPLETE = :replies_incomplete
            SUPPORT_MEDIA_RATE_LIMIT = :support_media_rate_limit
            SUPPORT_REQUEST_RATE_LIMIT = :support_request_rate_limit
            TOO_MANY_IDS = :too_many_ids
            UNKNOWN_FIELD = :unknown_field
            UNSUPPORTED_MEDIA_TYPE = :unsupported_media_type
            WEBHOOK_INACTIVE = :webhook_inactive
            WRITE_TRACKING_UNAVAILABLE = :write_tracking_unavailable
            X_WRITE_UNCONFIRMED = :x_write_unconfirmed
            X_ACCOUNT_FEATURE_REQUIRED = :x_account_feature_required
            X_ACCOUNT_PROTECTED = :x_account_protected
            X_ACCOUNT_SUSPENDED = :x_account_suspended
            X_API_RATE_LIMITED = :x_api_rate_limited
            X_API_UNAVAILABLE = :x_api_unavailable
            X_API_UNAUTHORIZED = :x_api_unauthorized
            X_AUTH_FAILURE = :x_auth_failure
            X_CONTENT_TOO_LONG = :x_content_too_long
            X_DAILY_LIMIT = :x_daily_limit
            X_DM_NOT_ALLOWED = :x_dm_not_allowed
            X_DUPLICATE_ACTION = :x_duplicate_action
            X_LOGIN_AUTH_FAILED = :x_login_auth_failed
            X_LOGIN_CHALLENGE = :x_login_challenge
            X_LOGIN_DENIED = :x_login_denied
            X_LOGIN_FAILED = :x_login_failed
            X_LOGIN_PROXY_ERROR = :x_login_proxy_error
            X_LOGIN_RATE_LIMITED = :x_login_rate_limited
            X_LOGIN_SERVICE_UNAVAILABLE = :x_login_service_unavailable
            X_LOGIN_SUSPENDED = :x_login_suspended
            X_RATE_LIMITED = :x_rate_limited
            X_REJECTED = :x_rejected
            X_TARGET_NOT_FOUND = :x_target_not_found
            X_TRANSIENT_ERROR = :x_transient_error
            X_USER_LOOKUP_FAILED = :x_user_lookup_failed
            X_WRITE_AMBIGUOUS = :x_write_ambiguous
            X_WRITE_FAILED = :x_write_failed

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see XTwitterScraper::Models::Error::Error::StructuredError#type
          module Type
            extend XTwitterScraper::Internal::Type::Enum

            API_ERROR = :api_error
            AUTHENTICATION_ERROR = :authentication_error
            BILLING_ERROR = :billing_error
            DEPENDENCY_ERROR = :dependency_error
            INVALID_REQUEST_ERROR = :invalid_request_error
            PERMISSION_ERROR = :permission_error
            RATE_LIMIT_ERROR = :rate_limit_error

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(Symbol, XTwitterScraper::Models::Error::Error::LegacyErrorCode, XTwitterScraper::Models::Error::Error::StructuredError)]
      end
    end
  end
end
