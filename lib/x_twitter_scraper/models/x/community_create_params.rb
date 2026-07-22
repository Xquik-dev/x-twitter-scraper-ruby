# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Communities#create
      class CommunityCreateParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute account
        #   X account (@username or ID) creating the community
        #
        #   @return [String]
        required :account, String

        # @!attribute name
        #   Community name
        #
        #   @return [String]
        required :name, String

        # @!attribute idempotency_key
        #
        #   @return [String]
        required :idempotency_key, String

        # @!attribute description
        #   Community description
        #
        #   @return [String, nil]
        optional :description, String

        # @!method initialize(account:, name:, idempotency_key:, description: nil, request_options: {})
        #   @param account [String] X account (@username or ID) creating the community
        #
        #   @param name [String] Community name
        #
        #   @param idempotency_key [String]
        #
        #   @param description [String] Community description
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
