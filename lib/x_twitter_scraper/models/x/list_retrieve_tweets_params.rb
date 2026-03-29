# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Lists#retrieve_tweets
      class ListRetrieveTweetsParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute cursor
        #   Pagination cursor
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute include_replies
        #   Include replies (default false)
        #
        #   @return [Boolean, nil]
        optional :include_replies, XTwitterScraper::Internal::Type::Boolean

        # @!attribute since_time
        #   Unix timestamp - filter after
        #
        #   @return [String, nil]
        optional :since_time, String

        # @!attribute until_time
        #   Unix timestamp - filter before
        #
        #   @return [String, nil]
        optional :until_time, String

        # @!method initialize(id:, cursor: nil, include_replies: nil, since_time: nil, until_time: nil, request_options: {})
        #   @param id [String]
        #
        #   @param cursor [String] Pagination cursor
        #
        #   @param include_replies [Boolean] Include replies (default false)
        #
        #   @param since_time [String] Unix timestamp - filter after
        #
        #   @param until_time [String] Unix timestamp - filter before
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
