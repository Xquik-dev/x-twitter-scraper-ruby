# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      module Tweets
        # @see XTwitterScraper::Resources::X::Tweets::Retweet#delete
        class RetweetDeleteParams < XTwitterScraper::Internal::Type::BaseModel
          extend XTwitterScraper::Internal::Type::RequestParameters::Converter
          include XTwitterScraper::Internal::Type::RequestParameters

          # @!attribute tweet_id
          #
          #   @return [String]
          required :tweet_id, String

          # @!attribute account
          #   X account (@username or account ID)
          #
          #   @return [String]
          required :account, String

          # @!method initialize(tweet_id:, account:, request_options: {})
          #   @param tweet_id [String]
          #
          #   @param account [String] X account (@username or account ID)
          #
          #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
