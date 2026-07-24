# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Subscribe#create
    class SubscribeCreateResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute status
      #
      #   @return [Symbol, XTwitterScraper::Models::SubscribeCreateResponse::Status]
      required :status, enum: -> { XTwitterScraper::Models::SubscribeCreateResponse::Status }

      # @!attribute url
      #
      #   @return [String]
      required :url, String

      # @!method initialize(message:, status:, url:)
      #   @param message [String]
      #   @param status [Symbol, XTwitterScraper::Models::SubscribeCreateResponse::Status]
      #   @param url [String]

      # @see XTwitterScraper::Models::SubscribeCreateResponse#status
      module Status
        extend XTwitterScraper::Internal::Type::Enum

        CHECKOUT_CREATED = :checkout_created
        ALREADY_SUBSCRIBED = :already_subscribed
        PAYMENT_ISSUE = :payment_issue

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
