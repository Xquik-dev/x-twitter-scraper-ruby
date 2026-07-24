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
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute health
        #
        #   @return [Symbol, XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Health]
        required :health,
                 enum: -> { XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Health }

        # @!attribute status
        #
        #   @return [String]
        required :status, String

        # @!attribute x_user_id
        #
        #   @return [String]
        required :x_user_id, String, api_name: :xUserId

        # @!attribute x_username
        #
        #   @return [String]
        required :x_username, String, api_name: :xUsername

        # @!method initialize(id:, created_at:, health:, status:, x_user_id:, x_username:)
        #   Sanitized X account summary returned by connect and reauth.
        #
        #   @param id [String]
        #   @param created_at [Time]
        #   @param health [Symbol, XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse::Health]
        #   @param status [String]
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
      end
    end
  end
end
