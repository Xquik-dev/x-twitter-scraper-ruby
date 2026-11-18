# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class ActivityRecord < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute object
      #
      #   @return [Symbol, XTwitterScraper::Models::ActivityRecord::ObjectItem]
      required :object, enum: -> { XTwitterScraper::Models::ActivityRecord::ObjectItem }

      # @!attribute id
      #   Activity ID.
      #
      #   @return [String]
      required :id, String

      # @!attribute kind
      #   Kind of the activity. Only a signed-in dashboard session sees an `api_key`
      #   record.
      #
      #   @return [Symbol, XTwitterScraper::Models::ActivityRecord::Kind]
      required :kind, enum: -> { XTwitterScraper::Models::ActivityRecord::Kind }

      # @!attribute type
      #   Type of the activity within its kind, the same as the type of its Activity log
      #   row. Examples are a write action type, an extraction tool type, a monitor
      #   change, a monitor event type or a ledger entry type.
      #
      #   @return [String]
      required :type, String

      # @!attribute status
      #
      #   @return [Symbol, XTwitterScraper::Models::ActivityRecord::Status]
      required :status, enum: -> { XTwitterScraper::Models::ActivityRecord::Status }

      # @!attribute url
      #   Dashboard page of this activity.
      #
      #   @return [String]
      required :url, String

      # @!attribute request_id
      #   ID of the API request behind this activity.
      #
      #   @return [String, nil]
      required :request_id, String, api_name: :requestId, nil?: true

      # @!attribute timestamps
      #
      #   @return [XTwitterScraper::Models::ActivityRecord::Timestamps]
      required :timestamps, -> { XTwitterScraper::Models::ActivityRecord::Timestamps }

      # @!attribute request
      #   The API request behind this activity. Null for activity from before Oct 30,
      #   2026, and for activity no API request starts, such as a monitor event, a webhook
      #   delivery or a credit grant.
      #
      #   @return [XTwitterScraper::Models::ActivityRecord::Request, nil]
      required :request, -> { XTwitterScraper::Models::ActivityRecord::Request }, nil?: true

      # @!attribute caller_
      #
      #   @return [XTwitterScraper::Models::ActivityRecord::Caller]
      required :caller_, -> { XTwitterScraper::Models::ActivityRecord::Caller }, api_name: :caller

      # @!attribute charge
      #   Credits charged for this activity.
      #
      #   @return [XTwitterScraper::Models::ActivityRecord::Charge, nil]
      required :charge, -> { XTwitterScraper::Models::ActivityRecord::Charge }, nil?: true

      # @!attribute details
      #   Fields of this kind of activity, such as its target. A field can hold JSON, such
      #   as the data of a monitor event or the payload of a webhook delivery.
      #
      #   @return [Hash{Symbol=>Object}]
      required :details, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

      # @!attribute related
      #   Up to 5 other activities on the same subject within 7 days, newest first.
      #
      #   @return [Array<XTwitterScraper::Models::ActivityRecord::Related>]
      required :related, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::ActivityRecord::Related] }

      # @!method initialize(object:, id:, kind:, type:, status:, url:, request_id:, timestamps:, request:, caller_:, charge:, details:, related:)
      #   Full technical record of 1 activity. Timestamps are ISO 8601 in UTC to the
      #   millisecond.
      #
      #   @param object [Symbol, XTwitterScraper::Models::ActivityRecord::ObjectItem]
      #
      #   @param id [String] Activity ID.
      #
      #   @param kind [Symbol, XTwitterScraper::Models::ActivityRecord::Kind] Kind of the activity. Only a signed-in dashboard session sees an `api_key` record.
      #
      #   @param type [String] Type of the activity within its kind, the same as the type of its Activity log row. Examples are a write action type, an extraction tool type, a monitor change, a monitor event type or a ledger entry type.
      #
      #   @param status [Symbol, XTwitterScraper::Models::ActivityRecord::Status]
      #
      #   @param url [String] Dashboard page of this activity.
      #
      #   @param request_id [String, nil] ID of the API request behind this activity.
      #
      #   @param timestamps [XTwitterScraper::Models::ActivityRecord::Timestamps]
      #
      #   @param request [XTwitterScraper::Models::ActivityRecord::Request, nil] The API request behind this activity. Null for activity from before Oct 30, 2026, and for activity no API request starts, such as a monitor event, a webhook delivery or a credit grant.
      #
      #   @param caller_ [XTwitterScraper::Models::ActivityRecord::Caller]
      #
      #   @param charge [XTwitterScraper::Models::ActivityRecord::Charge, nil] Credits charged for this activity.
      #
      #   @param details [Hash{Symbol=>Object}] Fields of this kind of activity, such as its target. A field can hold JSON, such as the data of a monitor event or the payload of a webhook delivery.
      #
      #   @param related [Array<XTwitterScraper::Models::ActivityRecord::Related>] Up to 5 other activities on the same subject within 7 days, newest first.

      module ObjectItem
        extend XTwitterScraper::Internal::Type::Enum

        ACTIVITY = :activity

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # Kind of the activity. Only a signed-in dashboard session sees an `api_key`
      # record.
      module Kind
        extend XTwitterScraper::Internal::Type::Enum

        WRITE_ACTION = :write_action
        EXTRACTION = :extraction
        MONITOR_CHANGE = :monitor_change
        API_KEY = :api_key
        BILLING = :billing
        GIVEAWAY_DRAW = :giveaway_draw
        MONITOR_EVENT = :monitor_event
        MEDIA_DOWNLOAD = :media_download
        MEDIA_SHARE = :media_share
        SUPPORT_TICKET = :support_ticket
        WEBHOOK_DELIVERY = :webhook_delivery
        WEBHOOK_ENDPOINT = :webhook_endpoint
        X_ACCOUNT_CONNECTION = :x_account_connection

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      module Status
        extend XTwitterScraper::Internal::Type::Enum

        COMPLETED = :completed
        RUNNING = :running
        FAILED = :failed
        CANCELED = :canceled

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class Timestamps < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute updated_at
        #
        #   @return [Time, nil]
        optional :updated_at, Time, api_name: :updatedAt

        # @!attribute completed_at
        #
        #   @return [Time, nil]
        optional :completed_at, Time, api_name: :completedAt

        # @!attribute confirmed_at
        #
        #   @return [Time, nil]
        optional :confirmed_at, Time, api_name: :confirmedAt

        # @!attribute expires_at
        #
        #   @return [Time, nil]
        optional :expires_at, Time, api_name: :expiresAt

        # @!attribute occurred_at
        #
        #   @return [Time, nil]
        optional :occurred_at, Time, api_name: :occurredAt

        # @!attribute discovered_at
        #
        #   @return [Time, nil]
        optional :discovered_at, Time, api_name: :discoveredAt

        # @!attribute posted_at
        #
        #   @return [Time, nil]
        optional :posted_at, Time, api_name: :postedAt

        # @!attribute first_attempted_at
        #
        #   @return [Time, nil]
        optional :first_attempted_at, Time, api_name: :firstAttemptedAt

        # @!attribute delivered_at
        #
        #   @return [Time, nil]
        optional :delivered_at, Time, api_name: :deliveredAt

        # @!attribute next_retry_at
        #
        #   @return [Time, nil]
        optional :next_retry_at, Time, api_name: :nextRetryAt

        # @!attribute exhausted_at
        #
        #   @return [Time, nil]
        optional :exhausted_at, Time, api_name: :exhaustedAt

        # @!attribute drawn_at
        #
        #   @return [Time, nil]
        optional :drawn_at, Time, api_name: :drawnAt

        # @!attribute last_used_at
        #
        #   @return [Time, nil]
        optional :last_used_at, Time, api_name: :lastUsedAt

        # @!attribute paused_at
        #
        #   @return [Time, nil]
        optional :paused_at, Time, api_name: :pausedAt

        # @!method initialize(created_at:, updated_at: nil, completed_at: nil, confirmed_at: nil, expires_at: nil, occurred_at: nil, discovered_at: nil, posted_at: nil, first_attempted_at: nil, delivered_at: nil, next_retry_at: nil, exhausted_at: nil, drawn_at: nil, last_used_at: nil, paused_at: nil)
        #   @param created_at [Time]
        #
        #   @param updated_at [Time]
        #
        #   @param completed_at [Time]
        #
        #   @param confirmed_at [Time]
        #
        #   @param expires_at [Time]
        #
        #   @param occurred_at [Time]
        #
        #   @param discovered_at [Time]
        #
        #   @param posted_at [Time]
        #
        #   @param first_attempted_at [Time]
        #
        #   @param delivered_at [Time]
        #
        #   @param next_retry_at [Time]
        #
        #   @param exhausted_at [Time]
        #
        #   @param drawn_at [Time]
        #
        #   @param last_used_at [Time]
        #
        #   @param paused_at [Time]
      end

      class Request < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute method_
        #
        #   @return [Symbol, XTwitterScraper::Models::ActivityRecord::Request::Method]
        required :method_, enum: -> { XTwitterScraper::Models::ActivityRecord::Request::Method }, api_name: :method

        # @!attribute path
        #
        #   @return [String]
        required :path, String

        # @!attribute http_status
        #
        #   @return [Integer]
        required :http_status, Integer, api_name: :httpStatus

        # @!attribute duration_ms
        #
        #   @return [Integer]
        required :duration_ms, Integer, api_name: :durationMs

        # @!attribute ip_address
        #
        #   @return [String, nil]
        required :ip_address, String, api_name: :ipAddress, nil?: true

        # @!attribute user_agent
        #
        #   @return [String, nil]
        required :user_agent, String, api_name: :userAgent, nil?: true

        # @!attribute at
        #
        #   @return [Time]
        required :at, Time

        # @!method initialize(method_:, path:, http_status:, duration_ms:, ip_address:, user_agent:, at:)
        #   The API request behind this activity. Null for activity from before Oct 30,
        #   2026, and for activity no API request starts, such as a monitor event, a webhook
        #   delivery or a credit grant.
        #
        #   @param method_ [Symbol, XTwitterScraper::Models::ActivityRecord::Request::Method]
        #
        #   @param path [String]
        #
        #   @param http_status [Integer]
        #
        #   @param duration_ms [Integer]
        #
        #   @param ip_address [String, nil]
        #
        #   @param user_agent [String, nil]
        #
        #   @param at [Time]

        module Method
          extend XTwitterScraper::Internal::Type::Enum

          DELETE = :DELETE
          PATCH = :PATCH
          POST = :POST
          PUT = :PUT

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      class Caller < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute auth_method
        #
        #   @return [Symbol, XTwitterScraper::Models::ActivityRecord::Caller::AuthMethod, nil]
        required :auth_method, enum: -> { XTwitterScraper::Models::ActivityRecord::Caller::AuthMethod }, api_name: :authMethod, nil?: true

        # @!attribute api_key
        #   Name and prefix of the API key used. Never its value.
        #
        #   @return [XTwitterScraper::Models::ActivityRecord::Caller::ApiKey, nil]
        required :api_key, -> { XTwitterScraper::Models::ActivityRecord::Caller::ApiKey }, api_name: :apiKey, nil?: true

        # @!attribute oauth_client
        #
        #   @return [XTwitterScraper::Models::ActivityRecord::Caller::OauthClient, nil]
        required :oauth_client, -> { XTwitterScraper::Models::ActivityRecord::Caller::OauthClient }, api_name: :oauthClient, nil?: true

        # @!method initialize(auth_method:, api_key:, oauth_client:)
        #   @param auth_method [Symbol, XTwitterScraper::Models::ActivityRecord::Caller::AuthMethod, nil]
        #
        #   @param api_key [XTwitterScraper::Models::ActivityRecord::Caller::ApiKey, nil] Name and prefix of the API key used. Never its value.
        #
        #   @param oauth_client [XTwitterScraper::Models::ActivityRecord::Caller::OauthClient, nil]

        module AuthMethod
          extend XTwitterScraper::Internal::Type::Enum

          API_KEY = :api_key
          OAUTH = :oauth
          SESSION = :session

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class ApiKey < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute prefix
          #
          #   @return [String]
          required :prefix, String

          # @!method initialize(name:, prefix:)
          #   Name and prefix of the API key used. Never its value.
          #
          #   @param name [String]
          #
          #   @param prefix [String]
        end

        class OauthClient < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!method initialize(id:, name:)
          #   @param id [String]
          #
          #   @param name [String]
        end
      end

      class Charge < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute credits
        #
        #   @return [Integer]
        required :credits, Integer

        # @!attribute balance_after
        #
        #   @return [Integer]
        required :balance_after, Integer, api_name: :balanceAfter

        # @!attribute at
        #
        #   @return [Time]
        required :at, Time

        # @!method initialize(credits:, balance_after:, at:)
        #   Credits charged for this activity.
        #
        #   @param credits [Integer]
        #
        #   @param balance_after [Integer]
        #
        #   @param at [Time]
      end

      class Related < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute type
        #
        #   @return [String]
        required :type, String

        # @!attribute status
        #
        #   @return [Symbol, XTwitterScraper::Models::ActivityRecord::Related::Status]
        required :status, enum: -> { XTwitterScraper::Models::ActivityRecord::Related::Status }

        # @!attribute created_at
        #
        #   @return [Time]
        required :created_at, Time, api_name: :createdAt

        # @!attribute url
        #
        #   @return [String]
        required :url, String

        # @!method initialize(id:, type:, status:, created_at:, url:)
        #   @param id [String]
        #
        #   @param type [String]
        #
        #   @param status [Symbol, XTwitterScraper::Models::ActivityRecord::Related::Status]
        #
        #   @param created_at [Time]
        #
        #   @param url [String]

        module Status
          extend XTwitterScraper::Internal::Type::Enum

          COMPLETED = :completed
          RUNNING = :running
          FAILED = :failed
          CANCELED = :canceled

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
