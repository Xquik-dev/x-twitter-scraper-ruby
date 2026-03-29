# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Styles#analyze
    class StyleAnalyzeParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute username
      #   X username to analyze
      #
      #   @return [String]
      required :username, String

      # @!method initialize(username:, request_options: {})
      #   @param username [String] X username to analyze
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
