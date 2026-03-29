# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Tweets#create
      class TweetCreateResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute success
        #
        #   @return [Boolean, true]
        required :success, const: true

        # @!attribute tweet_id
        #
        #   @return [String]
        required :tweet_id, String, api_name: :tweetId

        # @!method initialize(tweet_id:, success: true)
        #   @param tweet_id [String]
        #   @param success [Boolean, true]
      end
    end
  end
end
