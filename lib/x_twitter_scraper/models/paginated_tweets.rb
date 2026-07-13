# frozen_string_literal: true

module XTwitterScraper
  module Models
    class PaginatedTweets < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute has_next_page
      #
      #   @return [Boolean]
      required :has_next_page, XTwitterScraper::Internal::Type::Boolean

      # @!attribute next_cursor
      #
      #   @return [String]
      required :next_cursor, String

      # @!attribute tweets
      #
      #   @return [Array<XTwitterScraper::Models::SearchTweet>]
      required :tweets, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::SearchTweet] }

      # @!method initialize(has_next_page:, next_cursor:, tweets:)
      #   Paginated list of tweets with cursor-based navigation.
      #
      #   @param has_next_page [Boolean]
      #   @param next_cursor [String]
      #   @param tweets [Array<XTwitterScraper::Models::SearchTweet>]
    end
  end
end
