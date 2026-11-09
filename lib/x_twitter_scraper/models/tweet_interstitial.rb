# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class TweetInterstitial < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute display_type
      #   How x.com shows the notice. `NonCompliant` marks a post that broke X's rules.
      #
      #   @return [String, nil]
      optional :display_type, String, api_name: :displayType

      # @!attribute text
      #
      #   @return [XTwitterScraper::Models::TweetInterstitial::Text, nil]
      optional :text, -> { XTwitterScraper::TweetInterstitial::Text }

      # @!method initialize(display_type: nil, text: nil)
      #   The notice x.com covers the post with until someone chooses to view it, such as
      #   X's public interest notice on a post that broke its rules but stays up.
      #
      #   @param display_type [String] How x.com shows the notice. `NonCompliant` marks a post that broke X's rules.
      #
      #   @param text [XTwitterScraper::Models::TweetInterstitial::Text]

      # @see XTwitterScraper::Models::TweetInterstitial#text
      class Text < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute text
        #   The notice's text.
        #
        #   @return [String, nil]
        optional :text, String

        # @!attribute rtl
        #   Whether X writes it right to left.
        #
        #   @return [Boolean, nil]
        optional :rtl, XTwitterScraper::Internal::Type::Boolean

        # @!attribute entities
        #   Links inside the notice, by character range.
        #
        #   @return [Array<XTwitterScraper::Models::TweetInterstitial::Text::Entity>, nil]
        optional :entities,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::TweetInterstitial::Text::Entity] }

        # @!method initialize(text: nil, rtl: nil, entities: nil)
        #   @param text [String] The notice's text.
        #
        #   @param rtl [Boolean] Whether X writes it right to left.
        #
        #   @param entities [Array<XTwitterScraper::Models::TweetInterstitial::Text::Entity>] Links inside the notice, by character range.

        # @see XTwitterScraper::Models::TweetInterstitial::Text#entities
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
          #   @return [XTwitterScraper::Models::TweetInterstitial::Text::Entity::Ref, nil]
          optional :ref, -> { XTwitterScraper::TweetInterstitial::Text::Entity::Ref }

          # @!method initialize(from_index: nil, to_index: nil, ref: nil)
          #   @param from_index [Integer] Whole number from 0.
          #
          #   @param to_index [Integer] Whole number from 0.
          #
          #   @param ref [XTwitterScraper::Models::TweetInterstitial::Text::Entity::Ref]

          # @see XTwitterScraper::Models::TweetInterstitial::Text::Entity#ref
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
