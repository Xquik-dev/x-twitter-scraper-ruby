# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Users#retrieve_mentions
      class UserRetrieveMentionsParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute cursor
        #   Pagination cursor for mentions
        #
        #   @return [String, nil]
        optional :cursor, String

        # @!attribute since_time
        #   Unix timestamp - return mentions after this time
        #
        #   @return [String, nil]
        optional :since_time, String

        # @!attribute until_time
        #   Unix timestamp - return mentions before this time
        #
        #   @return [String, nil]
        optional :until_time, String

        # @!method initialize(id:, cursor: nil, since_time: nil, until_time: nil, request_options: {})
        #   @param id [String]
        #
        #   @param cursor [String] Pagination cursor for mentions
        #
        #   @param since_time [String] Unix timestamp - return mentions after this time
        #
        #   @param until_time [String] Unix timestamp - return mentions before this time
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
