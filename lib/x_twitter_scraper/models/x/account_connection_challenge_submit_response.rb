# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::AccountConnectionChallenges#submit
      class AccountConnectionChallengeSubmitResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #
        #   @return [Time, nil]
        optional :created_at, Time, api_name: :createdAt

        # @!attribute expires_at
        #
        #   @return [Time, nil]
        optional :expires_at, Time, api_name: :expiresAt

        # @!attribute health
        #
        #   @return [Symbol, XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Health, nil]
        optional :health,
                 enum: -> { XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Health }

        # @!attribute status
        #
        #   @return [Symbol, XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Status]
        required :status, enum: -> { XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Status }

        # @!attribute message
        #
        #   @return [String, nil]
        optional :message, String

        # @!attribute object
        #
        #   @return [Symbol, :x_account_connection_challenge, nil]
        optional :object, const: :x_account_connection_challenge

        # @!attribute username
        #
        #   @return [String, nil]
        optional :username, String

        # @!attribute x_user_id
        #
        #   @return [String, nil]
        optional :x_user_id, String, api_name: :xUserId

        # @!attribute x_username
        #
        #   @return [String, nil]
        optional :x_username, String, api_name: :xUsername

        # @!method initialize(id:, created_at: nil, expires_at: nil, health: nil, status:, message: nil, object: :x_account_connection_challenge, username: nil, x_user_id: nil, x_username: nil)
        #   Sanitized X account summary returned by connect and reauth.
        #
        #   @param id [String]
        #   @param status [Symbol, XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Status]
        #   @param created_at [Time]
        #   @param expires_at [Time]
        #   @param health [Symbol, XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Health]
        #   @param message [String]
        #   @param object [Symbol, :x_account_connection_challenge]
        #   @param username [String]
        #   @param x_user_id [String]
        #   @param x_username [String]

        # @see XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse#health
        module Health
          extend XTwitterScraper::Internal::Type::Enum

          HEALTHY = :healthy
          LOCKED = :locked
          NEEDS_REAUTH = :needsReauth
          RECOVERING = :recovering
          SUSPENDED = :suspended
          TEMPORARY_ISSUE = :temporaryIssue

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse#status
        module Status
          extend XTwitterScraper::Internal::Type::Enum

          ACTIVE = :active
          REQUIRES_EMAIL_CODE = :requires_email_code

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
