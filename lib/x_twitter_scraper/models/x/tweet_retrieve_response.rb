# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Tweets#retrieve
      class TweetRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute tweet
        #   Full tweet with text, engagement metrics, media, and metadata.
        #
        #   @return [XTwitterScraper::Models::X::TweetDetail]
        required :tweet, -> { XTwitterScraper::X::TweetDetail }

        # @!attribute author
        #   Author of a tweet with follower count and verification status.
        #
        #   @return [XTwitterScraper::Models::X::TweetAuthor, nil]
        optional :author, -> { XTwitterScraper::X::TweetAuthor }

        # @!method initialize(tweet:, author: nil)
        #   @param tweet [XTwitterScraper::Models::X::TweetDetail] Full tweet with text, engagement metrics, media, and metadata.
        #
        #   @param author [XTwitterScraper::Models::X::TweetAuthor] Author of a tweet with follower count and verification status.
      end
    end
  end
end
