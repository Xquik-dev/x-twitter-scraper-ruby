# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Credits#topup_balance
    class CreditTopupBalanceResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute redirect_url
      #   Stable Xquik redirect URL for the active checkout.
      #
      #   @return [String]
      required :redirect_url, String

      # @!attribute url
      #   Same stable Xquik redirect URL as redirect_url. The response never exposes the
      #   hosted checkout URL.
      #
      #   @return [String]
      required :url, String

      # @!method initialize(redirect_url:, url:)
      #   Some parameter documentations has been truncated, see
      #   {XTwitterScraper::Models::CreditTopupBalanceResponse} for more details.
      #
      #   @param redirect_url [String] Stable Xquik redirect URL for the active checkout.
      #
      #   @param url [String] Same stable Xquik redirect URL as redirect_url. The response never exposes the h
    end
  end
end
