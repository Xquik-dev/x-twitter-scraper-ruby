# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      module Tweets
        # @see XTwitterScraper::Resources::X::Tweets::Retweet#create
        class RetweetCreateResponse < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute account
          #   Connected account selected for the write.
          #
          #   @return [XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Account, nil]
          required :account, -> { XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Account }, nil?: true

          # @!attribute action
          #
          #   @return [Symbol, XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Action]
          required :action, enum: -> { XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Action }

          # @!attribute billing
          #   plannedCredits is the approved maximum. chargedCredits comes from the settled
          #   credit ledger. Pending or failed writes are not charged.
          #
          #   @return [XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Billing]
          required :billing, -> { XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Billing }

          # @!attribute charged
          #
          #   @return [Boolean]
          required :charged, XTwitterScraper::Internal::Type::Boolean

          # @!attribute charged_credits
          #
          #   @return [String]
          required :charged_credits, String, api_name: :chargedCredits

          # @!attribute next_action
          #   Exact follow-up an API client or agent should perform.
          #
          #   @return [XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::NextAction, nil]
          required :next_action,
                   -> { XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::NextAction },
                   api_name: :nextAction,
                   nil?: true

          # @!attribute object
          #
          #   @return [Symbol, :x_write_action]
          required :object, const: :x_write_action

          # @!attribute poll_after_ms
          #
          #   @return [Integer, nil]
          required :poll_after_ms, Integer, api_name: :pollAfterMs, nil?: true

          # @!attribute request
          #   Stable fingerprint and sanitized payload for replay checks.
          #
          #   @return [XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Request]
          required :request, -> { XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Request }

          # @!attribute result
          #   Confirmed result produced by the write, when available.
          #
          #   @return [XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Result, nil]
          required :result, -> { XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Result }, nil?: true

          # @!attribute retryable
          #   True only when a new attempt can reasonably succeed.
          #
          #   @return [Boolean]
          required :retryable, XTwitterScraper::Internal::Type::Boolean

          # @!attribute safe_to_retry
          #   True only when no write was dispatched and a new idempotency key may be used.
          #
          #   @return [Boolean]
          required :safe_to_retry, XTwitterScraper::Internal::Type::Boolean, api_name: :safeToRetry

          # @!attribute send_dispatched
          #
          #   @return [Boolean]
          required :send_dispatched, XTwitterScraper::Internal::Type::Boolean, api_name: :sendDispatched

          # @!attribute status
          #
          #   @return [Symbol, XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Status]
          required :status, enum: -> { XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Status }

          # @!attribute status_url
          #
          #   @return [String]
          required :status_url, String, api_name: :statusUrl

          # @!attribute success
          #
          #   @return [Boolean]
          required :success, XTwitterScraper::Internal::Type::Boolean

          # @!attribute target
          #   Existing X resource targeted by the write, when applicable.
          #
          #   @return [XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Target, nil]
          required :target, -> { XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Target }, nil?: true

          # @!attribute target_id
          #
          #   @return [String, nil]
          required :target_id, String, api_name: :targetId, nil?: true

          # @!attribute terminal
          #
          #   @return [Boolean]
          required :terminal, XTwitterScraper::Internal::Type::Boolean

          # @!attribute write_action_id
          #
          #   @return [String]
          required :write_action_id, String, api_name: :writeActionId

          # @!attribute community_id
          #   Compatibility field for a confirmed community ID.
          #
          #   @return [String, nil]
          optional :community_id, String, api_name: :communityId

          # @!attribute community_name
          #   Confirmed community name when available.
          #
          #   @return [String, nil]
          optional :community_name, String, api_name: :communityName

          # @!attribute completed_at
          #
          #   @return [Time, nil]
          optional :completed_at, Time, api_name: :completedAt

          # @!attribute confirmation_attempts
          #
          #   @return [Integer, nil]
          optional :confirmation_attempts, Integer, api_name: :confirmationAttempts

          # @!attribute confirmation_checked_at
          #
          #   @return [Time, nil]
          optional :confirmation_checked_at, Time, api_name: :confirmationCheckedAt

          # @!attribute confirmed_at
          #
          #   @return [Time, nil]
          optional :confirmed_at, Time, api_name: :confirmedAt

          # @!attribute created_at
          #
          #   @return [Time, nil]
          optional :created_at, Time, api_name: :createdAt

          # @!attribute details
          #   Structured recovery context for a failed write.
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :details, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

          # @!attribute error
          #
          #   @return [String, nil]
          optional :error, String

          # @!attribute expires_at
          #   Deadline for resolving a non-terminal write. This is not the Idempotency-Key
          #   retention deadline.
          #
          #   @return [Time, nil]
          optional :expires_at, Time, api_name: :expiresAt

          # @!attribute idempotent
          #
          #   @return [Boolean, nil]
          optional :idempotent, XTwitterScraper::Internal::Type::Boolean

          # @!attribute media
          #   Media count, kind, size, and billing details when used.
          #
          #   @return [Hash{Symbol=>Object}, nil]
          optional :media, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

          # @!attribute media_id
          #   Compatibility field for a confirmed media upload ID.
          #
          #   @return [String, nil]
          optional :media_id, String, api_name: :mediaId

          # @!attribute media_url
          #   Public media URL when the upload creates one.
          #
          #   @return [String, nil]
          optional :media_url, String, api_name: :mediaUrl

          # @!attribute message
          #
          #   @return [String, nil]
          optional :message, String

          # @!attribute message_id
          #   Compatibility field for a confirmed direct message ID.
          #
          #   @return [String, nil]
          optional :message_id, String, api_name: :messageId

          # @!attribute request_hash
          #
          #   @return [String, nil]
          optional :request_hash, String, api_name: :requestHash

          # @!attribute request_id
          #
          #   @return [String, nil]
          optional :request_id, String, api_name: :requestId

          # @!attribute result_id
          #   Compatibility result ID for other write actions.
          #
          #   @return [String, nil]
          optional :result_id, String, api_name: :resultId

          # @!attribute send_dispatched_at
          #   Dispatch timestamp when the write reached execution.
          #
          #   @return [Time, nil]
          optional :send_dispatched_at, Time, api_name: :sendDispatchedAt

          # @!attribute tweet_id
          #   Compatibility field for a confirmed tweet result ID.
          #
          #   @return [String, nil]
          optional :tweet_id, String, api_name: :tweetId

          # @!attribute updated_at
          #
          #   @return [Time, nil]
          optional :updated_at, Time, api_name: :updatedAt

          # @!method initialize(id:, account:, action:, billing:, charged:, charged_credits:, next_action:, poll_after_ms:, request:, result:, retryable:, safe_to_retry:, send_dispatched:, status:, status_url:, success:, target:, target_id:, terminal:, write_action_id:, community_id: nil, community_name: nil, completed_at: nil, confirmation_attempts: nil, confirmation_checked_at: nil, confirmed_at: nil, created_at: nil, details: nil, error: nil, expires_at: nil, idempotent: nil, media: nil, media_id: nil, media_url: nil, message: nil, message_id: nil, request_hash: nil, request_id: nil, result_id: nil, send_dispatched_at: nil, tweet_id: nil, updated_at: nil, object: :x_write_action)
          #   Some parameter documentations has been truncated, see
          #   {XTwitterScraper::Models::X::Tweets::RetweetCreateResponse} for more details.
          #
          #   Durable write lifecycle record. Poll statusUrl until terminal is true. Reusing
          #   the original Idempotency-Key returns this same record. Submit a new write only
          #   when safeToRetry is true, using a new key.
          #
          #   @param id [String]
          #
          #   @param account [XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Account, nil] Connected account selected for the write.
          #
          #   @param action [Symbol, XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Action]
          #
          #   @param billing [XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Billing] plannedCredits is the approved maximum. chargedCredits comes from the settled cr
          #
          #   @param charged [Boolean]
          #
          #   @param charged_credits [String]
          #
          #   @param next_action [XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::NextAction, nil] Exact follow-up an API client or agent should perform.
          #
          #   @param poll_after_ms [Integer, nil]
          #
          #   @param request [XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Request] Stable fingerprint and sanitized payload for replay checks.
          #
          #   @param result [XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Result, nil] Confirmed result produced by the write, when available.
          #
          #   @param retryable [Boolean] True only when a new attempt can reasonably succeed.
          #
          #   @param safe_to_retry [Boolean] True only when no write was dispatched and a new idempotency key may be used.
          #
          #   @param send_dispatched [Boolean]
          #
          #   @param status [Symbol, XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Status]
          #
          #   @param status_url [String]
          #
          #   @param success [Boolean]
          #
          #   @param target [XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Target, nil] Existing X resource targeted by the write, when applicable.
          #
          #   @param target_id [String, nil]
          #
          #   @param terminal [Boolean]
          #
          #   @param write_action_id [String]
          #
          #   @param community_id [String] Compatibility field for a confirmed community ID.
          #
          #   @param community_name [String] Confirmed community name when available.
          #
          #   @param completed_at [Time]
          #
          #   @param confirmation_attempts [Integer]
          #
          #   @param confirmation_checked_at [Time]
          #
          #   @param confirmed_at [Time]
          #
          #   @param created_at [Time]
          #
          #   @param details [Hash{Symbol=>Object}] Structured recovery context for a failed write.
          #
          #   @param error [String]
          #
          #   @param expires_at [Time] Deadline for resolving a non-terminal write. This is not the Idempotency-Key ret
          #
          #   @param idempotent [Boolean]
          #
          #   @param media [Hash{Symbol=>Object}] Media count, kind, size, and billing details when used.
          #
          #   @param media_id [String] Compatibility field for a confirmed media upload ID.
          #
          #   @param media_url [String] Public media URL when the upload creates one.
          #
          #   @param message [String]
          #
          #   @param message_id [String] Compatibility field for a confirmed direct message ID.
          #
          #   @param request_hash [String]
          #
          #   @param request_id [String]
          #
          #   @param result_id [String] Compatibility result ID for other write actions.
          #
          #   @param send_dispatched_at [Time] Dispatch timestamp when the write reached execution.
          #
          #   @param tweet_id [String] Compatibility field for a confirmed tweet result ID.
          #
          #   @param updated_at [Time]
          #
          #   @param object [Symbol, :x_write_action]

          # @see XTwitterScraper::Models::X::Tweets::RetweetCreateResponse#account
          class Account < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute id
            #
            #   @return [String]
            required :id, String

            # @!attribute username
            #
            #   @return [String]
            required :username, String

            # @!method initialize(id:, username:)
            #   Connected account selected for the write.
            #
            #   @param id [String]
            #   @param username [String]
          end

          # @see XTwitterScraper::Models::X::Tweets::RetweetCreateResponse#action
          module Action
            extend XTwitterScraper::Internal::Type::Enum

            CREATE_TWEET = :create_tweet
            DELETE_TWEET = :delete_tweet
            LIKE = :like
            UNLIKE = :unlike
            RETWEET = :retweet
            UNRETWEET = :unretweet
            FOLLOW = :follow
            UNFOLLOW = :unfollow
            REMOVE_FOLLOWER = :remove_follower
            SEND_DM = :send_dm
            UPLOAD_MEDIA = :upload_media
            UPDATE_PROFILE = :update_profile
            UPDATE_AVATAR = :update_avatar
            UPDATE_BANNER = :update_banner
            CREATE_COMMUNITY = :create_community
            DELETE_COMMUNITY = :delete_community
            JOIN_COMMUNITY = :join_community
            LEAVE_COMMUNITY = :leave_community

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see XTwitterScraper::Models::X::Tweets::RetweetCreateResponse#billing
          class Billing < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute charged
            #
            #   @return [Boolean]
            required :charged, XTwitterScraper::Internal::Type::Boolean

            # @!attribute charged_credits
            #
            #   @return [String]
            required :charged_credits, String, api_name: :chargedCredits

            # @!attribute planned_credits
            #
            #   @return [String]
            required :planned_credits, String, api_name: :plannedCredits

            # @!attribute status
            #
            #   @return [Symbol, XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Billing::Status]
            required :status, enum: -> { XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Billing::Status }

            # @!method initialize(charged:, charged_credits:, planned_credits:, status:)
            #   plannedCredits is the approved maximum. chargedCredits comes from the settled
            #   credit ledger. Pending or failed writes are not charged.
            #
            #   @param charged [Boolean]
            #   @param charged_credits [String]
            #   @param planned_credits [String]
            #   @param status [Symbol, XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Billing::Status]

            # @see XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Billing#status
            module Status
              extend XTwitterScraper::Internal::Type::Enum

              NOT_CHARGED = :not_charged
              PENDING = :pending
              CHARGED = :charged
              CHARGE_FAILED = :charge_failed
              REFUNDED = :refunded

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see XTwitterScraper::Models::X::Tweets::RetweetCreateResponse#next_action
          class NextAction < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [Symbol, XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::NextAction::Type]
            required :type, enum: -> { XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::NextAction::Type }

            # @!attribute after_ms
            #
            #   @return [Integer, nil]
            optional :after_ms, Integer, api_name: :afterMs

            # @!attribute requires_new_idempotency_key
            #
            #   @return [Boolean, nil]
            optional :requires_new_idempotency_key,
                     XTwitterScraper::Internal::Type::Boolean,
                     api_name: :requiresNewIdempotencyKey

            # @!attribute url
            #
            #   @return [String, nil]
            optional :url, String

            # @!method initialize(type:, after_ms: nil, requires_new_idempotency_key: nil, url: nil)
            #   Exact follow-up an API client or agent should perform.
            #
            #   @param type [Symbol, XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::NextAction::Type]
            #   @param after_ms [Integer]
            #   @param requires_new_idempotency_key [Boolean]
            #   @param url [String]

            # @see XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::NextAction#type
            module Type
              extend XTwitterScraper::Internal::Type::Enum

              POLL = :poll
              RETRY = :retry
              VERIFY_RESULT = :verify_result
              FIX_REQUEST = :fix_request

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see XTwitterScraper::Models::X::Tweets::RetweetCreateResponse#request
          class Request < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute hash_
            #   Stable hash of account, action, target, and payload.
            #
            #   @return [String, nil]
            required :hash_, String, api_name: :hash, nil?: true

            # @!attribute payload
            #   Exact sanitized payload dispatched for this action.
            #
            #   @return [Hash{Symbol=>Object}, nil]
            required :payload,
                     XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown],
                     nil?: true

            # @!method initialize(hash_:, payload:)
            #   Stable fingerprint and sanitized payload for replay checks.
            #
            #   @param hash_ [String, nil] Stable hash of account, action, target, and payload.
            #
            #   @param payload [Hash{Symbol=>Object}, nil] Exact sanitized payload dispatched for this action.
          end

          # @see XTwitterScraper::Models::X::Tweets::RetweetCreateResponse#result
          class Result < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute id
            #
            #   @return [String, nil]
            optional :id, String

            # @!attribute state
            #
            #   @return [String, nil]
            optional :state, String

            # @!attribute type
            #
            #   @return [Symbol, XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Result::Type, nil]
            optional :type, enum: -> { XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Result::Type }

            # @!method initialize(id: nil, state: nil, type: nil)
            #   Confirmed result produced by the write, when available.
            #
            #   @param id [String]
            #   @param state [String]
            #   @param type [Symbol, XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Result::Type]

            # @see XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Result#type
            module Type
              extend XTwitterScraper::Internal::Type::Enum

              TWEET = :tweet
              DIRECT_MESSAGE = :direct_message
              MEDIA = :media
              COMMUNITY = :community
              STATE_CHANGE = :state_change

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see XTwitterScraper::Models::X::Tweets::RetweetCreateResponse#status
          module Status
            extend XTwitterScraper::Internal::Type::Enum

            ACCEPTED = :accepted
            DISPATCHING = :dispatching
            PENDING_CONFIRMATION = :pending_confirmation
            SUCCESS = :success
            FAILED = :failed
            EXPIRED = :expired

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see XTwitterScraper::Models::X::Tweets::RetweetCreateResponse#target
          class Target < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute id
            #
            #   @return [String]
            required :id, String

            # @!attribute type
            #
            #   @return [Symbol, XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Target::Type]
            required :type, enum: -> { XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Target::Type }

            # @!method initialize(id:, type:)
            #   Existing X resource targeted by the write, when applicable.
            #
            #   @param id [String]
            #   @param type [Symbol, XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Target::Type]

            # @see XTwitterScraper::Models::X::Tweets::RetweetCreateResponse::Target#type
            module Type
              extend XTwitterScraper::Internal::Type::Enum

              TWEET = :tweet
              USER = :user
              COMMUNITY = :community

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end
      end
    end
  end
end
