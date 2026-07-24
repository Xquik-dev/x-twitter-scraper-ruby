# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      class XAccount < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute health
        #   Derived connection health. `healthy` = session active. `needsReauth` = user must
        #   submit fresh credentials. `locked` = X locked the account; unlock on x.com
        #   first. `suspended` = X banned the account. `recovering` = past cooldown, will
        #   auto-retry on next use. `temporaryIssue` = temporary connection problem; retry
        #   shortly.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::XAccount::Health]
        required :health, enum: -> { XTwitterScraper::X::XAccount::Health }

        # @!attribute status
        #
        #   @return [String]
        required :status, String

        # @!attribute updated_at
        #
        #   @return [Time]
        required :updated_at, Time, api_name: :updatedAt

        # @!attribute x_user_id
        #
        #   @return [String]
        required :x_user_id, String, api_name: :xUserId

        # @!attribute x_username
        #
        #   @return [String]
        required :x_username, String, api_name: :xUsername

        # @!attribute cookies_obtained_at
        #
        #   @return [Time, nil]
        optional :cookies_obtained_at, Time, api_name: :cookiesObtainedAt

        # @!method initialize(id:, created_at:, health:, status:, updated_at:, x_user_id:, x_username:, cookies_obtained_at: nil)
        #   Some parameter documentations has been truncated, see
        #   {XTwitterScraper::Models::X::XAccount} for more details.
        #
        #   Linked X account summary with connection status, health, and timestamp metadata.
        #
        #   @param id [String]
        #
        #   @param created_at [Time]
        #
        #   @param health [Symbol, XTwitterScraper::Models::X::XAccount::Health] Derived connection health. `healthy` = session active. `needsReauth` = user must
        #
        #   @param status [String]
        #
        #   @param updated_at [Time]
        #
        #   @param x_user_id [String]
        #
        #   @param x_username [String]
        #
        #   @param cookies_obtained_at [Time]

        # Derived connection health. `healthy` = session active. `needsReauth` = user must
        # submit fresh credentials. `locked` = X locked the account; unlock on x.com
        # first. `suspended` = X banned the account. `recovering` = past cooldown, will
        # auto-retry on next use. `temporaryIssue` = temporary connection problem; retry
        # shortly.
        #
        # @see XTwitterScraper::Models::X::XAccount#health
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

    XAccount = X::XAccount
  end
end
