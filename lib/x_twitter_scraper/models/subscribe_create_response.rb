# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Subscribe#create
    class SubscribeCreateResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute url
      #
      #   @return [String]
      required :url, String

      # @!attribute message
      #
      #   @return [String, nil]
      optional :message, String

      # @!attribute status
      #
      #   @return [Symbol, XTwitterScraper::Models::SubscribeCreateResponse::Status, nil]
      optional :status, enum: -> { XTwitterScraper::Models::SubscribeCreateResponse::Status }

      # @!method initialize(url:, message: nil, status: nil)
      #   @param url [String]
      #   @param message [String]
      #   @param status [Symbol, XTwitterScraper::Models::SubscribeCreateResponse::Status]

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
