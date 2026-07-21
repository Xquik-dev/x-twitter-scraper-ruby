# typed: strong

module XTwitterScraper
  module Models
    class Error < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(XTwitterScraper::Error, XTwitterScraper::Internal::AnyHash)
        end

      sig do
        returns(
          T.any(
            XTwitterScraper::Error::Error::LegacyErrorCode::OrSymbol,
            XTwitterScraper::Error::Error::StructuredError
          )
        )
      end
      attr_accessor :error

      # Human-readable error guidance.
      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      # Machine-readable reason for a login cooldown.
      sig { returns(T.nilable(String)) }
      attr_reader :reason

      sig { params(reason: String).void }
      attr_writer :reason

      # Required wait in seconds.
      sig { returns(T.nilable(Integer)) }
      attr_reader :retry_after

      sig { params(retry_after: Integer).void }
      attr_writer :retry_after

      # Required wait in milliseconds.
      sig { returns(T.nilable(Integer)) }
      attr_reader :retry_after_ms

      sig { params(retry_after_ms: Integer).void }
      attr_writer :retry_after_ms

      # Error response. Default v1 returns a legacy string error code. Send
      # `xquik-api-contract: 2026-04-29` to receive the structured best-practice error
      # object.
      sig do
        params(
          error:
            T.any(
              XTwitterScraper::Error::Error::LegacyErrorCode::OrSymbol,
              XTwitterScraper::Error::Error::StructuredError::OrHash
            ),
          message: String,
          reason: String,
          retry_after: Integer,
          retry_after_ms: Integer
        ).returns(T.attached_class)
      end
      def self.new(
        error:,
        # Human-readable error guidance.
        message: nil,
        # Machine-readable reason for a login cooldown.
        reason: nil,
        # Required wait in seconds.
        retry_after: nil,
        # Required wait in milliseconds.
        retry_after_ms: nil
      )
      end

      sig do
        override.returns(
          {
            error:
              T.any(
                XTwitterScraper::Error::Error::LegacyErrorCode::OrSymbol,
                XTwitterScraper::Error::Error::StructuredError
              ),
            message: String,
            reason: String,
            retry_after: Integer,
            retry_after_ms: Integer
          }
        )
      end
      def to_hash
      end

      module Error
        extend XTwitterScraper::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol,
              XTwitterScraper::Error::Error::StructuredError
            )
          end

        module LegacyErrorCode
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, XTwitterScraper::Error::Error::LegacyErrorCode)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INTERNAL_ERROR =
            T.let(
              :internal_error,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          ACCOUNT_ALREADY_CONNECTED =
            T.let(
              :account_already_connected,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          ACCOUNT_NEEDS_REAUTH =
            T.let(
              :account_needs_reauth,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          ACCOUNT_NOT_FOUND =
            T.let(
              :account_not_found,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          ACCOUNT_REQUIRED =
            T.let(
              :account_required,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          ACCOUNT_RESTRICTED =
            T.let(
              :account_restricted,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          API_KEY_LIMIT_REACHED =
            T.let(
              :api_key_limit_reached,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          ARTICLE_NOT_FOUND =
            T.let(
              :article_not_found,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          DM_NOT_PERMITTED =
            T.let(
              :dm_not_permitted,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          INVALID_FORMAT =
            T.let(
              :invalid_format,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          INVALID_ID =
            T.let(
              :invalid_id,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          INVALID_INPUT =
            T.let(
              :invalid_input,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          INVALID_PARAMS =
            T.let(
              :invalid_params,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          INVALID_TOOL_TYPE =
            T.let(
              :invalid_tool_type,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          INVALID_TWEET_ID =
            T.let(
              :invalid_tweet_id,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          INVALID_TWEET_URL =
            T.let(
              :invalid_tweet_url,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          INVALID_USER_ID =
            T.let(
              :invalid_user_id,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          INVALID_USER_IDS =
            T.let(
              :invalid_user_ids,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          INVALID_USERNAME =
            T.let(
              :invalid_username,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          INVALID_JSON =
            T.let(
              :invalid_json,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          INSUFFICIENT_CREDITS =
            T.let(
              :insufficient_credits,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          LOGIN_COOLDOWN =
            T.let(
              :login_cooldown,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          LOGIN_FAILED =
            T.let(
              :login_failed,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          MEDIA_DOWNLOAD_FAILED =
            T.let(
              :media_download_failed,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          MISSING_PARAMS =
            T.let(
              :missing_params,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          MISSING_QUERY =
            T.let(
              :missing_query,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          MONITOR_ALREADY_EXISTS =
            T.let(
              :monitor_already_exists,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          NO_MEDIA =
            T.let(
              :no_media,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          NO_CREDITS =
            T.let(
              :no_credits,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          NO_SUBSCRIPTION =
            T.let(
              :no_subscription,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          NOT_FOUND =
            T.let(
              :not_found,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          PAYMENT_FAILED =
            T.let(
              :payment_failed,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          RATE_LIMIT_EXCEEDED =
            T.let(
              :rate_limit_exceeded,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          SERVICE_UNAVAILABLE =
            T.let(
              :service_unavailable,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          STYLE_NOT_FOUND =
            T.let(
              :style_not_found,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          SUBSCRIPTION_INACTIVE =
            T.let(
              :subscription_inactive,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          TWEET_NOT_FOUND =
            T.let(
              :tweet_not_found,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          UNAUTHENTICATED =
            T.let(
              :unauthenticated,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          UNSUPPORTED_FIELD =
            T.let(
              :unsupported_field,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          USER_NOT_FOUND =
            T.let(
              :user_not_found,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_ACCOUNT_FEATURE_REQUIRED =
            T.let(
              :x_account_feature_required,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_ACCOUNT_PROTECTED =
            T.let(
              :x_account_protected,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_ACCOUNT_SUSPENDED =
            T.let(
              :x_account_suspended,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_API_RATE_LIMITED =
            T.let(
              :x_api_rate_limited,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_API_UNAVAILABLE =
            T.let(
              :x_api_unavailable,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_API_UNAUTHORIZED =
            T.let(
              :x_api_unauthorized,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_AUTH_FAILURE =
            T.let(
              :x_auth_failure,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_CONTENT_TOO_LONG =
            T.let(
              :x_content_too_long,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_DAILY_LIMIT =
            T.let(
              :x_daily_limit,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_DM_NOT_ALLOWED =
            T.let(
              :x_dm_not_allowed,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_DUPLICATE_ACTION =
            T.let(
              :x_duplicate_action,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_LOGIN_AUTH_FAILED =
            T.let(
              :x_login_auth_failed,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_LOGIN_CHALLENGE =
            T.let(
              :x_login_challenge,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_LOGIN_DENIED =
            T.let(
              :x_login_denied,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_LOGIN_FAILED =
            T.let(
              :x_login_failed,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_LOGIN_PROXY_ERROR =
            T.let(
              :x_login_proxy_error,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_LOGIN_RATE_LIMITED =
            T.let(
              :x_login_rate_limited,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_LOGIN_SERVICE_UNAVAILABLE =
            T.let(
              :x_login_service_unavailable,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_LOGIN_SUSPENDED =
            T.let(
              :x_login_suspended,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_RATE_LIMITED =
            T.let(
              :x_rate_limited,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_REJECTED =
            T.let(
              :x_rejected,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_TARGET_NOT_FOUND =
            T.let(
              :x_target_not_found,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_TRANSIENT_ERROR =
            T.let(
              :x_transient_error,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_USER_LOOKUP_FAILED =
            T.let(
              :x_user_lookup_failed,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_WRITE_AMBIGUOUS =
            T.let(
              :x_write_ambiguous,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )
          X_WRITE_FAILED =
            T.let(
              :x_write_failed,
              XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Error::Error::LegacyErrorCode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class StructuredError < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Error::Error::StructuredError,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig do
            returns(
              XTwitterScraper::Error::Error::StructuredError::Code::OrSymbol
            )
          end
          attr_accessor :code

          sig { returns(String) }
          attr_accessor :message

          sig do
            returns(
              XTwitterScraper::Error::Error::StructuredError::Type::OrSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              code:
                XTwitterScraper::Error::Error::StructuredError::Code::OrSymbol,
              message: String,
              type:
                XTwitterScraper::Error::Error::StructuredError::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(code:, message:, type:)
          end

          sig do
            override.returns(
              {
                code:
                  XTwitterScraper::Error::Error::StructuredError::Code::OrSymbol,
                message: String,
                type:
                  XTwitterScraper::Error::Error::StructuredError::Type::OrSymbol
              }
            )
          end
          def to_hash
          end

          module Code
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::Error::Error::StructuredError::Code
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            INTERNAL_ERROR =
              T.let(
                :internal_error,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            ACCOUNT_ALREADY_CONNECTED =
              T.let(
                :account_already_connected,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            ACCOUNT_NEEDS_REAUTH =
              T.let(
                :account_needs_reauth,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            ACCOUNT_NOT_FOUND =
              T.let(
                :account_not_found,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            ACCOUNT_REQUIRED =
              T.let(
                :account_required,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            ACCOUNT_RESTRICTED =
              T.let(
                :account_restricted,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            API_KEY_LIMIT_REACHED =
              T.let(
                :api_key_limit_reached,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            ARTICLE_NOT_FOUND =
              T.let(
                :article_not_found,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            DM_NOT_PERMITTED =
              T.let(
                :dm_not_permitted,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            INVALID_FORMAT =
              T.let(
                :invalid_format,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            INVALID_ID =
              T.let(
                :invalid_id,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            INVALID_INPUT =
              T.let(
                :invalid_input,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            INVALID_PARAMS =
              T.let(
                :invalid_params,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            INVALID_TOOL_TYPE =
              T.let(
                :invalid_tool_type,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            INVALID_TWEET_ID =
              T.let(
                :invalid_tweet_id,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            INVALID_TWEET_URL =
              T.let(
                :invalid_tweet_url,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            INVALID_USER_ID =
              T.let(
                :invalid_user_id,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            INVALID_USER_IDS =
              T.let(
                :invalid_user_ids,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            INVALID_USERNAME =
              T.let(
                :invalid_username,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            INVALID_JSON =
              T.let(
                :invalid_json,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            INSUFFICIENT_CREDITS =
              T.let(
                :insufficient_credits,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            LOGIN_COOLDOWN =
              T.let(
                :login_cooldown,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            LOGIN_FAILED =
              T.let(
                :login_failed,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            MEDIA_DOWNLOAD_FAILED =
              T.let(
                :media_download_failed,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            MISSING_PARAMS =
              T.let(
                :missing_params,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            MISSING_QUERY =
              T.let(
                :missing_query,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            MONITOR_ALREADY_EXISTS =
              T.let(
                :monitor_already_exists,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            NO_MEDIA =
              T.let(
                :no_media,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            NO_CREDITS =
              T.let(
                :no_credits,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            NO_SUBSCRIPTION =
              T.let(
                :no_subscription,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            NOT_FOUND =
              T.let(
                :not_found,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            PAYMENT_FAILED =
              T.let(
                :payment_failed,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            RATE_LIMIT_EXCEEDED =
              T.let(
                :rate_limit_exceeded,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            SERVICE_UNAVAILABLE =
              T.let(
                :service_unavailable,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            STYLE_NOT_FOUND =
              T.let(
                :style_not_found,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            SUBSCRIPTION_INACTIVE =
              T.let(
                :subscription_inactive,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            TWEET_NOT_FOUND =
              T.let(
                :tweet_not_found,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            UNAUTHENTICATED =
              T.let(
                :unauthenticated,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            UNSUPPORTED_FIELD =
              T.let(
                :unsupported_field,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            USER_NOT_FOUND =
              T.let(
                :user_not_found,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_ACCOUNT_FEATURE_REQUIRED =
              T.let(
                :x_account_feature_required,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_ACCOUNT_PROTECTED =
              T.let(
                :x_account_protected,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_ACCOUNT_SUSPENDED =
              T.let(
                :x_account_suspended,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_API_RATE_LIMITED =
              T.let(
                :x_api_rate_limited,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_API_UNAVAILABLE =
              T.let(
                :x_api_unavailable,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_API_UNAUTHORIZED =
              T.let(
                :x_api_unauthorized,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_AUTH_FAILURE =
              T.let(
                :x_auth_failure,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_CONTENT_TOO_LONG =
              T.let(
                :x_content_too_long,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_DAILY_LIMIT =
              T.let(
                :x_daily_limit,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_DM_NOT_ALLOWED =
              T.let(
                :x_dm_not_allowed,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_DUPLICATE_ACTION =
              T.let(
                :x_duplicate_action,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_LOGIN_AUTH_FAILED =
              T.let(
                :x_login_auth_failed,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_LOGIN_CHALLENGE =
              T.let(
                :x_login_challenge,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_LOGIN_DENIED =
              T.let(
                :x_login_denied,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_LOGIN_FAILED =
              T.let(
                :x_login_failed,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_LOGIN_PROXY_ERROR =
              T.let(
                :x_login_proxy_error,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_LOGIN_RATE_LIMITED =
              T.let(
                :x_login_rate_limited,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_LOGIN_SERVICE_UNAVAILABLE =
              T.let(
                :x_login_service_unavailable,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_LOGIN_SUSPENDED =
              T.let(
                :x_login_suspended,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_RATE_LIMITED =
              T.let(
                :x_rate_limited,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_REJECTED =
              T.let(
                :x_rejected,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_TARGET_NOT_FOUND =
              T.let(
                :x_target_not_found,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_TRANSIENT_ERROR =
              T.let(
                :x_transient_error,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_USER_LOOKUP_FAILED =
              T.let(
                :x_user_lookup_failed,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_WRITE_AMBIGUOUS =
              T.let(
                :x_write_ambiguous,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )
            X_WRITE_FAILED =
              T.let(
                :x_write_failed,
                XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Error::Error::StructuredError::Code::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module Type
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::Error::Error::StructuredError::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            API_ERROR =
              T.let(
                :api_error,
                XTwitterScraper::Error::Error::StructuredError::Type::TaggedSymbol
              )
            AUTHENTICATION_ERROR =
              T.let(
                :authentication_error,
                XTwitterScraper::Error::Error::StructuredError::Type::TaggedSymbol
              )
            BILLING_ERROR =
              T.let(
                :billing_error,
                XTwitterScraper::Error::Error::StructuredError::Type::TaggedSymbol
              )
            DEPENDENCY_ERROR =
              T.let(
                :dependency_error,
                XTwitterScraper::Error::Error::StructuredError::Type::TaggedSymbol
              )
            INVALID_REQUEST_ERROR =
              T.let(
                :invalid_request_error,
                XTwitterScraper::Error::Error::StructuredError::Type::TaggedSymbol
              )
            PERMISSION_ERROR =
              T.let(
                :permission_error,
                XTwitterScraper::Error::Error::StructuredError::Type::TaggedSymbol
              )
            RATE_LIMIT_ERROR =
              T.let(
                :rate_limit_error,
                XTwitterScraper::Error::Error::StructuredError::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Error::Error::StructuredError::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(T::Array[XTwitterScraper::Error::Error::Variants])
        end
        def self.variants
        end
      end
    end
  end
end
