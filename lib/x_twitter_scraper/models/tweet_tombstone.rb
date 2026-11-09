# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class TweetTombstone < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute type
      #   Visibility notice type.
      #
      #   @return [String, nil]
      optional :type, String

      # @!attribute text
      #
      #   @return [XTwitterScraper::Models::TweetTombstone::Text, nil]
      optional :text, -> { XTwitterScraper::TweetTombstone::Text }

      # @!method initialize(type: nil, text: nil)
      #   Public visibility notice attached to an available tweet.
      #
      #   @param type [String] Visibility notice type.
      #
      #   @param text [XTwitterScraper::Models::TweetTombstone::Text]

      # @see XTwitterScraper::Models::TweetTombstone#text
      class Text < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute text
        #   Human-readable notice text.
        #
        #   @return [String, nil]
        optional :text, String

        # @!attribute rtl
        #   Right-to-left text direction.
        #
        #   @return [Boolean, nil]
        optional :rtl, XTwitterScraper::Internal::Type::Boolean

        # @!attribute entities
        #
        #   @return [Array<XTwitterScraper::Models::TweetTombstone::Text::Entity>, nil]
        optional :entities,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::TweetTombstone::Text::Entity] }

        # @!method initialize(text: nil, rtl: nil, entities: nil)
        #   @param text [String] Human-readable notice text.
        #
        #   @param rtl [Boolean] Right-to-left text direction.
        #
        #   @param entities [Array<XTwitterScraper::Models::TweetTombstone::Text::Entity>]

        # @see XTwitterScraper::Models::TweetTombstone::Text#entities
        class Entity < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute from_index
          #   Whole number from 0.
          #
          #   @return [Integer, nil]
          optional :from_index, Integer, api_name: :fromIndex

          # @!attribute to_index
          #   Whole number from 0.
          #
          #   @return [Integer, nil]
          optional :to_index, Integer, api_name: :toIndex

          # @!attribute ref
          #
          #   @return [XTwitterScraper::Models::TweetTombstone::Text::Entity::Ref, nil]
          optional :ref, -> { XTwitterScraper::TweetTombstone::Text::Entity::Ref }

          # @!method initialize(from_index: nil, to_index: nil, ref: nil)
          #   @param from_index [Integer] Whole number from 0.
          #
          #   @param to_index [Integer] Whole number from 0.
          #
          #   @param ref [XTwitterScraper::Models::TweetTombstone::Text::Entity::Ref]

          # @see XTwitterScraper::Models::TweetTombstone::Text::Entity#ref
          class Ref < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute type
            #
            #   @return [String, nil]
            optional :type, String

            # @!attribute url
            #
            #   @return [String, nil]
            optional :url, String

            # @!attribute url_type
            #
            #   @return [String, nil]
            optional :url_type, String, api_name: :urlType

            # @!attribute text
            #
            #   @return [String, nil]
            optional :text, String

            # @!attribute screen_name
            #
            #   @return [String, nil]
            optional :screen_name, String, api_name: :screenName

            # @!method initialize(type: nil, url: nil, url_type: nil, text: nil, screen_name: nil)
            #   @param type [String]
            #   @param url [String]
            #   @param url_type [String]
            #   @param text [String]
            #   @param screen_name [String]
          end
        end
      end
    end
  end
end
