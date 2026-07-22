# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Accounts#retrieve
      class XAccountDetail < XTwitterScraper::Internal::Type::BaseModel
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
        #   @return [Symbol, XTwitterScraper::Models::X::XAccountDetail::Health]
        required :health, enum: -> { XTwitterScraper::X::XAccountDetail::Health }

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

        # @!attribute cookies_obtained_at
        #
        #   @return [Time, nil]
        optional :cookies_obtained_at, Time, api_name: :cookiesObtainedAt

        # @!attribute updated_at
        #
        #   @return [Time, nil]
        optional :updated_at, Time, api_name: :updatedAt

        # @!method initialize(id:, created_at:, health:, status:, x_user_id:, x_username:, cookies_obtained_at: nil, updated_at: nil)
        #   Connected X account details with health and timestamp metadata.
        #
        #   @param id [String]
        #   @param created_at [Time]
        #   @param health [Symbol, XTwitterScraper::Models::X::XAccountDetail::Health]
        #   @param status [String]
        #   @param x_user_id [String]
        #   @param x_username [String]
        #   @param cookies_obtained_at [Time]
        #   @param updated_at [Time]

        # @see XTwitterScraper::Models::X::XAccountDetail#health
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

    XAccountDetail = X::XAccountDetail
  end
end
