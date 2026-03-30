# frozen_string_literal: true

module XTwitterScraper
  module Models
    class StyleProfileSummary < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute fetched_at
      #
      #   @return [Time]
      required :fetched_at, Time, api_name: :fetchedAt

      # @!attribute is_own_account
      #
      #   @return [Boolean]
      required :is_own_account, XTwitterScraper::Internal::Type::Boolean, api_name: :isOwnAccount

      # @!attribute tweet_count
      #
      #   @return [Integer]
      required :tweet_count, Integer, api_name: :tweetCount

      # @!attribute x_username
      #
      #   @return [String]
      required :x_username, String, api_name: :xUsername

      # @!method initialize(fetched_at:, is_own_account:, tweet_count:, x_username:)
      #   @param fetched_at [Time]
      #   @param is_own_account [Boolean]
      #   @param tweet_count [Integer]
      #   @param x_username [String]
    end
  end
end
