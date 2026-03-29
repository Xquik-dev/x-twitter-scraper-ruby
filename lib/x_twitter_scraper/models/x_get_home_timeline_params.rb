# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::X#get_home_timeline
    class XGetHomeTimelineParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute cursor
      #   Pagination cursor from previous response
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute seen_tweet_ids
      #   Comma-separated tweet IDs to exclude from results
      #
      #   @return [String, nil]
      optional :seen_tweet_ids, String

      # @!method initialize(cursor: nil, seen_tweet_ids: nil, request_options: {})
      #   @param cursor [String] Pagination cursor from previous response
      #
      #   @param seen_tweet_ids [String] Comma-separated tweet IDs to exclude from results
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
