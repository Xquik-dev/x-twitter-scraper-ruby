# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Tweets#get_quotes
      class TweetGetQuotesParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute cursor
        #   Pagination cursor for quote tweets
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute include_replies
        #   Include reply quotes (default false)
        #
        #   @return [Boolean, nil]
        optional :include_replies, XTwitterScraper::Internal::Type::Boolean

        # @!attribute since_time
        #   Unix timestamp - return quotes posted after this time
        #
        #   @return [String, nil]
        optional :since_time, String

        # @!attribute until_time
        #   Unix timestamp - return quotes posted before this time
        #
        #   @return [String, nil]
        optional :until_time, String

        # @!method initialize(id:, cursor: nil, include_replies: nil, since_time: nil, until_time: nil, request_options: {})
        #   @param id [String]
        #
        #   @param cursor [String] Pagination cursor for quote tweets
        #
        #   @param include_replies [Boolean] Include reply quotes (default false)
        #
        #   @param since_time [String] Unix timestamp - return quotes posted after this time
        #
        #   @param until_time [String] Unix timestamp - return quotes posted before this time
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
