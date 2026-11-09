# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class ImageFilteredTweets < XTwitterScraper::Models::PaginatedTweets
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::ImageFilteredTweets,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # What the image filter asked & how many posts it kept.
      sig { returns(XTwitterScraper::Models::ImageFilterSummary) }
      attr_reader :image_filter

      sig do
        params(
          image_filter: XTwitterScraper::Models::ImageFilterSummary::OrHash
        ).void
      end
      attr_writer :image_filter

      sig do
        returns(T::Array[XTwitterScraper::Models::ImageFilteredTweets::Tweet])
      end
      attr_accessor :tweets

      # Posts kept by the image filter. Each kept post carries its imageScore. Follow
      # next_cursor to check the next posts.
      sig do
        params(
          image_filter: XTwitterScraper::Models::ImageFilterSummary::OrHash,
          tweets:
            T::Array[
              XTwitterScraper::Models::ImageFilteredTweets::Tweet::OrHash
            ]
        ).returns(T.attached_class)
      end
      def self.new(
        # What the image filter asked & how many posts it kept.
        image_filter:,
        tweets:
      )
      end

      sig do
        override.returns(
          {
            image_filter: XTwitterScraper::Models::ImageFilterSummary,
            tweets:
              T::Array[XTwitterScraper::Models::ImageFilteredTweets::Tweet]
          }
        )
      end
      def to_hash
      end

      class Tweet < XTwitterScraper::Models::SearchTweet
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::ImageFilteredTweets::Tweet,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # How likely a photo shows what you asked for.
        sig { returns(Float) }
        attr_accessor :image_score

        sig { params(image_score: Float).returns(T.attached_class) }
        def self.new(
          # How likely a photo shows what you asked for.
          image_score:
        )
        end

        sig { override.returns({ image_score: Float }) }
        def to_hash
        end
      end
    end
  end
end
