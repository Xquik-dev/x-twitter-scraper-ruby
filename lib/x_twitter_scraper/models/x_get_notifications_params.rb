# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::X#get_notifications
    class XGetNotificationsParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute cursor
      #   Pagination cursor for notifications
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute type
      #   Notification type filter
      #
      #   @return [Symbol, XTwitterScraper::Models::XGetNotificationsParams::Type, nil]
      optional :type, enum: -> { XTwitterScraper::XGetNotificationsParams::Type }

      # @!method initialize(cursor: nil, type: nil, request_options: {})
      #   @param cursor [String] Pagination cursor for notifications
      #
      #   @param type [Symbol, XTwitterScraper::Models::XGetNotificationsParams::Type] Notification type filter
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

      # Notification type filter
      module Type
        extend XTwitterScraper::Internal::Type::Enum

        ALL = :All
        VERIFIED = :Verified
        MENTIONS = :Mentions

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
