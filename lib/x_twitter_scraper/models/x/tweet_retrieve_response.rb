# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Tweets#retrieve
      class TweetRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute tweet
        #
        #   @return [XTwitterScraper::Models::X::TweetDetail]
        required :tweet, -> { XTwitterScraper::X::TweetDetail }

        # @!attribute author
        #
        #   @return [XTwitterScraper::Models::X::TweetAuthor, nil]
        optional :author, -> { XTwitterScraper::X::TweetAuthor }

        # @!method initialize(tweet:, author: nil)
        #   @param tweet [XTwitterScraper::Models::X::TweetDetail]
        #   @param author [XTwitterScraper::Models::X::TweetAuthor]
      end
    end
  end
end
