# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::X#get_notifications
    class XGetNotificationsResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute has_next_page
      #
      #   @return [Boolean]
      required :has_next_page, XTwitterScraper::Internal::Type::Boolean

      # @!attribute next_cursor
      #
      #   @return [String]
      required :next_cursor, String

      # @!attribute notifications
      #
      #   @return [Array<XTwitterScraper::Models::XGetNotificationsResponse::Notification>]
      required :notifications,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::XGetNotificationsResponse::Notification] }

      # @!method initialize(has_next_page:, next_cursor:, notifications:)
      #   @param has_next_page [Boolean]
      #   @param next_cursor [String]
      #   @param notifications [Array<XTwitterScraper::Models::XGetNotificationsResponse::Notification>]

      class Notification < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute message
        #
        #   @return [String, nil]
        optional :message, String

        # @!attribute timestamp
        #
        #   @return [String, nil]
        optional :timestamp, String

        # @!attribute type
        #
        #   @return [String, nil]
        optional :type, String

        # @!method initialize(id:, message: nil, timestamp: nil, type: nil)
        #   @param id [String]
        #   @param message [String]
        #   @param timestamp [String]
        #   @param type [String]
      end
    end
  end
end
