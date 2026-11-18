# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class TweetSmartTag < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   X's ID for the SmartTag.
      #
      #   @return [String, nil]
      optional :id, String

      # @!attribute info
      #
      #   @return [XTwitterScraper::Models::TweetSmartTag::Info, nil]
      optional :info, -> { XTwitterScraper::Models::TweetSmartTag::Info }

      # @!method initialize(id: nil, info: nil)
      #   X's SmartTag for a cashtag, smarttag or hashtag.
      #
      #   @param id [String] X's ID for the SmartTag.
      #
      #   @param info [XTwitterScraper::Models::TweetSmartTag::Info]

      class Info < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute info
        #
        #   @return [XTwitterScraper::Models::TweetSmartTag::Info::Info, nil]
        optional :info, -> { XTwitterScraper::Models::TweetSmartTag::Info::Info }

        # @!method initialize(info: nil)
        #   @param info [XTwitterScraper::Models::TweetSmartTag::Info::Info]

        class Info < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute active
          #   Whether X marks the SmartTag active.
          #
          #   @return [Boolean, nil]
          optional :active, XTwitterScraper::Internal::Type::Boolean

          # @!attribute name
          #
          #   @return [String, nil]
          optional :name, String

          # @!attribute ticker
          #
          #   @return [String, nil]
          optional :ticker, String

          # @!method initialize(active: nil, name: nil, ticker: nil)
          #   @param active [Boolean] Whether X marks the SmartTag active.
          #
          #   @param name [String]
          #
          #   @param ticker [String]
        end
      end
    end
  end
end
