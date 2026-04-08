# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Styles#list
    class StyleListResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute styles
      #
      #   @return [Array<XTwitterScraper::Models::StyleListResponse::Style>]
      required :styles,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::StyleListResponse::Style] }

      # @!method initialize(styles:)
      #   @param styles [Array<XTwitterScraper::Models::StyleListResponse::Style>]

      class Style < XTwitterScraper::Internal::Type::BaseModel
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
        #   Style profile summary with tweet count and ownership flag.
        #
        #   @param fetched_at [Time]
        #   @param is_own_account [Boolean]
        #   @param tweet_count [Integer]
        #   @param x_username [String]
      end
    end
  end
end
