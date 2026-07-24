# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Styles#update
    class StyleUpdateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

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

      # @!method initialize(id:, label:, tweets:, request_options: {})
      #   @param id [String]
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
