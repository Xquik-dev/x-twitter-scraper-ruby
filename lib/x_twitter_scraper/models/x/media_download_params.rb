# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Media#download
      class MediaDownloadParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute tweet_ids
        #   Array of tweet URLs or IDs (bulk, max 50)
        #
        #   @return [Array<String>, nil]
        optional :tweet_ids, XTwitterScraper::Internal::Type::ArrayOf[String], api_name: :tweetIds

        # @!attribute tweet_input
        #   Tweet URL or ID (single tweet)
        #
        #   @return [String, nil]
        optional :tweet_input, String, api_name: :tweetInput

        # @!method initialize(tweet_ids: nil, tweet_input: nil, request_options: {})
        #   @param tweet_ids [Array<String>] Array of tweet URLs or IDs (bulk, max 50)
        #
        #   @param tweet_input [String] Tweet URL or ID (single tweet)
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
