# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class CommunityNoteEntity < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute from_index
      #   Where it starts in the text.
      #
      #   @return [Integer, nil]
      optional :from_index, Integer, api_name: :fromIndex

      # @!attribute to_index
      #   Where it ends in the text.
      #
      #   @return [Integer, nil]
      optional :to_index, Integer, api_name: :toIndex

      # @!attribute ref
      #   What it points at.
      #
      #   @return [XTwitterScraper::Models::CommunityNoteEntity::Ref, nil]
      optional :ref, -> { XTwitterScraper::Models::CommunityNoteEntity::Ref }

      # @!method initialize(from_index: nil, to_index: nil, ref: nil)
      #   A link, tag or account inside a note's text.
      #
      #   @param from_index [Integer] Where it starts in the text.
      #
      #   @param to_index [Integer] Where it ends in the text.
      #
      #   @param ref [XTwitterScraper::Models::CommunityNoteEntity::Ref] What it points at.

      class Ref < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute type
        #   X's kind, such as TimelineUrl.
        #
        #   @return [String, nil]
        optional :type, String

        # @!attribute url
        #   The link.
        #
        #   @return [String, nil]
        optional :url, String

        # @!attribute url_type
        #   How X opens the link, such as ExternalUrl.
        #
        #   @return [String, nil]
        optional :url_type, String, api_name: :urlType

        # @!attribute text
        #   A hashtag's or cashtag's text.
        #
        #   @return [String, nil]
        optional :text, String

        # @!attribute screen_name
        #   A mentioned account's username.
        #
        #   @return [String, nil]
        optional :screen_name, String, api_name: :screenName

        # @!method initialize(type: nil, url: nil, url_type: nil, text: nil, screen_name: nil)
        #   What it points at.
        #
        #   @param type [String] X's kind, such as TimelineUrl.
        #
        #   @param url [String] The link.
        #
        #   @param url_type [String] How X opens the link, such as ExternalUrl.
        #
        #   @param text [String] A hashtag's or cashtag's text.
        #
        #   @param screen_name [String] A mentioned account's username.
      end
    end
  end
end
