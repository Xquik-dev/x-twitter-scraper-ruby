# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Media#create
      class MediaCreateParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute account
        #   X account (@username or account ID)
        #
        #   @return [String]
        required :account, String

        # @!attribute file
        #   Media file to upload
        #
        #   @return [Pathname, StringIO, IO, String, XTwitterScraper::FilePart]
        required :file, XTwitterScraper::Internal::Type::FileInput

        # @!attribute is_long_video
        #
        #   @return [Boolean, nil]
        optional :is_long_video, XTwitterScraper::Internal::Type::Boolean

        # @!method initialize(account:, file:, is_long_video: nil, request_options: {})
        #   @param account [String] X account (@username or account ID)
        #
        #   @param file [Pathname, StringIO, IO, String, XTwitterScraper::FilePart] Media file to upload
        #
        #   @param is_long_video [Boolean]
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
