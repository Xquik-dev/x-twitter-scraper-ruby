# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Profile#update_avatar
      class ProfileUpdateAvatarParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute account
        #   X account (@username or ID) receiving avatar from URL
        #
        #   @return [String]
        required :account, String

        # @!attribute url
        #   HTTPS URL to the avatar image to download
        #
        #   @return [String]
        required :url, String

        # @!method initialize(account:, url:, request_options: {})
        #   @param account [String] X account (@username or ID) receiving avatar from URL
        #
        #   @param url [String] HTTPS URL to the avatar image to download
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
