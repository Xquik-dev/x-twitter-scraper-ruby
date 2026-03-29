# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Profile#update_banner
      class ProfileUpdateBannerParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute account
        #   X account (@username or account ID)
        #
        #   @return [String]
        required :account, String

        # @!attribute file
        #   Banner image (max 2MB)
        #
        #   @return [Pathname, StringIO, IO, String, XTwitterScraper::FilePart]
        required :file, XTwitterScraper::Internal::Type::FileInput

        # @!method initialize(account:, file:, request_options: {})
        #   @param account [String] X account (@username or account ID)
        #
        #   @param file [Pathname, StringIO, IO, String, XTwitterScraper::FilePart] Banner image (max 2MB)
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
