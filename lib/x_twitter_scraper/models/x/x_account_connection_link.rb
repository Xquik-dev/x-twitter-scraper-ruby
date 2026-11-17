# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::AccountConnectionLinks#retrieve
      class XAccountConnectionLink < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute object
        #
        #   @return [Symbol, :x_account_connection_link]
        required :object, const: :x_account_connection_link

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute purpose
        #
        #   @return [Symbol, XTwitterScraper::Models::X::XAccountConnectionLink::Purpose]
        required :purpose, enum: -> { XTwitterScraper::X::XAccountConnectionLink::Purpose }

        # @!attribute status
        #   `failed` means 5 logins were refused, so make a new link. `revoked` means you
        #   revoked it, or the key that made it is paused, revoked, expired, no longer Full
        #   access or without `connectsXAccounts`. A link whose key resumes within its 30
        #   minutes reads `pending` again.
        #
        #   @return [Symbol, XTwitterScraper::Models::X::XAccountConnectionLink::Status]
        required :status, enum: -> { XTwitterScraper::X::XAccountConnectionLink::Status }

        # @!attribute reference
        #   Your own ID for this person, as you sent it.
        #
        #   @return [String, nil]
        required :reference, String, nil?: true

        # @!attribute return_url
        #   The page the link offers as a button once the account connects.
        #
        #   @return [String, nil]
        required :return_url, String, api_name: :returnUrl, nil?: true

        # @!attribute api_key_id
        #   The ID of the API key that made the link, or null when a dashboard session made
        #   it.
        #
        #   @return [String, nil]
        required :api_key_id, String, api_name: :apiKeyId, nil?: true

        # @!attribute account_id
        #
        #   @return [String, nil]
        required :account_id, String, api_name: :accountId, nil?: true

        # @!attribute x_user_id
        #
        #   @return [String, nil]
        required :x_user_id, String, api_name: :xUserId, nil?: true

        # @!attribute x_username
        #
        #   @return [String, nil]
        required :x_username, String, api_name: :xUsername, nil?: true

        # @!attribute health
        #
        #   @return [String, nil]
        required :health, String, nil?: true

        # @!attribute failure
        #   Why the last login didn't finish.
        #
        #   @return [String, nil]
        required :failure, String, nil?: true

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute expires_at
        #
        #   @return [Time]
        required :expires_at, Time, api_name: :expiresAt

        # @!attribute completed_at
        #
        #   @return [Time, nil]
        required :completed_at, Time, api_name: :completedAt, nil?: true

        # @!attribute url
        #   Present only in the response that creates the link.
        #
        #   @return [String, nil]
        optional :url, String

        # @!method initialize(id:, purpose:, status:, reference:, return_url:, api_key_id:, account_id:, x_user_id:, x_username:, health:, failure:, created_at:, expires_at:, completed_at:, url: nil, object: :x_account_connection_link)
        #   A link where a person connects an X account on Xquik's page.
        #
        #   @param id [String]
        #
        #   @param purpose [Symbol, XTwitterScraper::Models::X::XAccountConnectionLink::Purpose]
        #
        #   @param status [Symbol, XTwitterScraper::Models::X::XAccountConnectionLink::Status] `failed` means 5 logins were refused, so make a new link. `revoked` means you
        #
        #   @param reference [String, nil] Your own ID for this person, as you sent it.
        #
        #   @param return_url [String, nil] The page the link offers as a button once the account connects.
        #
        #   @param api_key_id [String, nil] The ID of the API key that made the link, or null when a dashboard session made it.
        #
        #   @param account_id [String, nil]
        #
        #   @param x_user_id [String, nil]
        #
        #   @param x_username [String, nil]
        #
        #   @param health [String, nil]
        #
        #   @param failure [String, nil] Why the last login didn't finish.
        #
        #   @param created_at [Time]
        #
        #   @param expires_at [Time]
        #
        #   @param completed_at [Time, nil]
        #
        #   @param url [String] Present only in the response that creates the link.
        #
        #   @param object [Symbol, :x_account_connection_link]

        # @see XTwitterScraper::Models::X::XAccountConnectionLink#purpose
        module Purpose
          extend XTwitterScraper::Internal::Type::Enum

          CONNECT = :connect
          RECONNECT = :reconnect

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # `failed` means 5 logins were refused, so make a new link. `revoked` means you
        # revoked it, or the key that made it is paused, revoked, expired, no longer Full
        # access or without `connectsXAccounts`. A link whose key resumes within its 30
        # minutes reads `pending` again.
        #
        # @see XTwitterScraper::Models::X::XAccountConnectionLink#status
        module Status
          extend XTwitterScraper::Internal::Type::Enum

          PENDING = :pending
          CONNECTING = :connecting
          REQUIRES_EMAIL_CODE = :requires_email_code
          CONNECTED = :connected
          FAILED = :failed
          EXPIRED = :expired
          REVOKED = :revoked

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
