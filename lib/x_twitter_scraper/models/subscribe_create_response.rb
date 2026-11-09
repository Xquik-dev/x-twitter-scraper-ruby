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

      # @!attribute charged_currency
      #   Currency the checkout charges. Only a checkout_created answer has it.
      #
      #   @return [Symbol, XTwitterScraper::Models::Currency, nil]
      optional :charged_currency, enum: -> { XTwitterScraper::Models::Currency }, api_name: :chargedCurrency

      # @!method initialize(message:, status:, url:, charged_currency: nil)
      #   @param message [String]
      #   @param status [Symbol, XTwitterScraper::Models::SubscribeCreateResponse::Status]
      #   @param url [String]
      #   @param charged_currency [Symbol, XTwitterScraper::Models::Currency] Currency the checkout charges. Only a checkout_created answer has it.

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
