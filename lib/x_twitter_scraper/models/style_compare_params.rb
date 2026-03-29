# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Styles#compare
    class StyleCompareParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute username1
      #   First username to compare
      #
      #   @return [String]
      required :username1, String

      # @!attribute username2
      #   Second username to compare
      #
      #   @return [String]
      required :username2, String

      # @!method initialize(username1:, username2:, request_options: {})
      #   @param username1 [String] First username to compare
      #
      #   @param username2 [String] Second username to compare
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
