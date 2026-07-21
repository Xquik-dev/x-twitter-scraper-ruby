# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::WriteActions#retrieve
      class WriteActionRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute action
        #
        #   @return [String]
        required :action, String

        # @!attribute charged
        #
        #   @return [Boolean]
        required :charged, XTwitterScraper::Internal::Type::Boolean

        # @!attribute charged_credits
        #
        #   @return [String]
        required :charged_credits, String, api_name: :chargedCredits

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute media
        #
        #   @return [XTwitterScraper::Models::X::WriteActionRetrieveResponse::Media]
        required :media, -> { XTwitterScraper::Models::X::WriteActionRetrieveResponse::Media }

        # @!attribute retryable
        #
        #   @return [Boolean, false]
        required :retryable, const: false

        # @!attribute send_dispatched
        #
        #   @return [Boolean]
        required :send_dispatched, XTwitterScraper::Internal::Type::Boolean, api_name: :sendDispatched

        # @!attribute status
        #
        #   @return [Symbol, XTwitterScraper::Models::X::WriteActionRetrieveResponse::Status]
        required :status, enum: -> { XTwitterScraper::Models::X::WriteActionRetrieveResponse::Status }

        # @!attribute write_action_id
        #
        #   @return [String]
        required :write_action_id, String, api_name: :writeActionId

        # @!attribute confirmation_attempts
        #
        #   @return [Integer, nil]
        optional :confirmation_attempts, Integer, api_name: :confirmationAttempts

        # @!attribute confirmation_checked_at
        #
        #   @return [Time, nil]
        optional :confirmation_checked_at, Time, api_name: :confirmationCheckedAt

        # @!attribute confirmation_source
        #
        #   @return [String, nil]
        optional :confirmation_source, String, api_name: :confirmationSource, nil?: true

        # @!attribute confirmed_at
        #
        #   @return [Time, nil]
        optional :confirmed_at, Time, api_name: :confirmedAt

        # @!attribute message
        #
        #   @return [String, nil]
        optional :message, String

        # @!attribute message_id
        #
        #   @return [String, nil]
        optional :message_id, String, api_name: :messageId

        # @!attribute send_dispatched_at
        #
        #   @return [Time, nil]
        optional :send_dispatched_at, Time, api_name: :sendDispatchedAt

        # @!attribute target_id
        #
        #   @return [String, nil]
        optional :target_id, String, api_name: :targetId, nil?: true

        # @!attribute tweet_id
        #
        #   @return [String, nil]
        optional :tweet_id, String, api_name: :tweetId

        # @!method initialize(action:, charged:, charged_credits:, created_at:, media:, send_dispatched:, status:, write_action_id:, confirmation_attempts: nil, confirmation_checked_at: nil, confirmation_source: nil, confirmed_at: nil, message: nil, message_id: nil, send_dispatched_at: nil, target_id: nil, tweet_id: nil, retryable: false)
        #   @param action [String]
        #   @param charged [Boolean]
        #   @param charged_credits [String]
        #   @param created_at [Time]
        #   @param media [XTwitterScraper::Models::X::WriteActionRetrieveResponse::Media]
        #   @param send_dispatched [Boolean]
        #   @param status [Symbol, XTwitterScraper::Models::X::WriteActionRetrieveResponse::Status]
        #   @param write_action_id [String]
        #   @param confirmation_attempts [Integer]
        #   @param confirmation_checked_at [Time]
        #   @param confirmation_source [String, nil]
        #   @param confirmed_at [Time]
        #   @param message [String]
        #   @param message_id [String]
        #   @param send_dispatched_at [Time]
        #   @param target_id [String, nil]
        #   @param tweet_id [String]
        #   @param retryable [Boolean, false]

        # @see XTwitterScraper::Models::X::WriteActionRetrieveResponse#media
        class Media < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute count
          #
          #   @return [Integer]
          required :count, Integer

          # @!attribute credits
          #
          #   @return [String]
          required :credits, String

          # @!attribute kind
          #
          #   @return [Symbol, XTwitterScraper::Models::X::WriteActionRetrieveResponse::Media::Kind]
          required :kind, enum: -> { XTwitterScraper::Models::X::WriteActionRetrieveResponse::Media::Kind }

          # @!attribute total_bytes
          #
          #   @return [String]
          required :total_bytes, String, api_name: :totalBytes

          # @!method initialize(count:, credits:, kind:, total_bytes:)
          #   @param count [Integer]
          #   @param credits [String]
          #   @param kind [Symbol, XTwitterScraper::Models::X::WriteActionRetrieveResponse::Media::Kind]
          #   @param total_bytes [String]

          # @see XTwitterScraper::Models::X::WriteActionRetrieveResponse::Media#kind
          module Kind
            extend XTwitterScraper::Internal::Type::Enum

            NONE = :none
            IMAGE = :image
            VIDEO = :video

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @see XTwitterScraper::Models::X::WriteActionRetrieveResponse#status
        module Status
          extend XTwitterScraper::Internal::Type::Enum

          SUCCESS = :success
          FAILED = :failed
          PENDING_CONFIRMATION = :pending_confirmation

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
