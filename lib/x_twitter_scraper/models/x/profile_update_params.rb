# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Profile#update
      class ProfileUpdateParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute account
        #   X account (@username or account ID)
        #
        #   @return [String]
        required :account, String

        # @!attribute description
        #   Bio description
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute location
        #
        #   @return [String, nil]
        optional :location, String

        # @!attribute name
        #   Display name
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute url
        #   Website URL
        #
        #   @return [String, nil]
        optional :url, String

        # @!method initialize(account:, description: nil, location: nil, name: nil, url: nil, request_options: {})
        #   @param account [String] X account (@username or account ID)
        #
        #   @param description [String] Bio description
        #
        #   @param location [String]
        #
        #   @param name [String] Display name
        #
        #   @param url [String] Website URL
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
