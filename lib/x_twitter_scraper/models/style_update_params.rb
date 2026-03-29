# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Styles#update
    class StyleUpdateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute username
      #
      #   @return [String]
      required :username, String

      # @!attribute label
      #   Display label for the style
      #
      #   @return [String]
      required :label, String

      # @!attribute tweets
      #   Array of tweet objects
      #
      #   @return [Array<XTwitterScraper::Models::StyleUpdateParams::Tweet>]
      required :tweets,
               -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::StyleUpdateParams::Tweet] }

      # @!method initialize(username:, label:, tweets:, request_options: {})
      #   @param username [String]
      #
      #   @param label [String] Display label for the style
      #
      #   @param tweets [Array<XTwitterScraper::Models::StyleUpdateParams::Tweet>] Array of tweet objects
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

      class Tweet < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute text
        #
        #   @return [String]
        required :text, String

        # @!method initialize(text:)
        #   @param text [String]
      end
    end
  end
end
