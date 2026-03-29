# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Users#retrieve
      class UserRetrieveParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute username
        #
        #   @return [String]
        required :username, String

        # @!method initialize(username:, request_options: {})
        #   @param username [String]
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
