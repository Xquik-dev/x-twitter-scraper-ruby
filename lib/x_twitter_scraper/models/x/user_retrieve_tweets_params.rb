# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Users#retrieve_tweets
      class UserRetrieveTweetsParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute cursor
        #   Pagination cursor from previous response
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute include_parent_tweet
        #   Include parent tweet for replies
        #
        #   @return [Boolean, nil]
        optional :include_parent_tweet, XTwitterScraper::Internal::Type::Boolean

        # @!attribute include_replies
        #   Include reply tweets
        #
        #   @return [Boolean, nil]
        optional :include_replies, XTwitterScraper::Internal::Type::Boolean

        # @!method initialize(id:, cursor: nil, include_parent_tweet: nil, include_replies: nil, request_options: {})
        #   @param id [String]
        #
        #   @param cursor [String] Pagination cursor from previous response
        #
        #   @param include_parent_tweet [Boolean] Include parent tweet for replies
        #
        #   @param include_replies [Boolean] Include reply tweets
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
