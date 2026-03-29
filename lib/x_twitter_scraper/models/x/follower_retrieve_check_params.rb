# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Followers#retrieve_check
      class FollowerRetrieveCheckParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute source
        #   Username to check (without @)
        #
        #   @return [String]
        required :source, String

        # @!attribute target
        #   Target username (without @)
        #
        #   @return [String]
        required :target, String

        # @!method initialize(source:, target:, request_options: {})
        #   @param source [String] Username to check (without @)
        #
        #   @param target [String] Target username (without @)
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
