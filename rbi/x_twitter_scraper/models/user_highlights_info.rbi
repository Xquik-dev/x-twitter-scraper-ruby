# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class UserHighlightsInfo < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::UserHighlightsInfo,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :can_highlight_tweets

      sig { params(can_highlight_tweets: T::Boolean).void }
      attr_writer :can_highlight_tweets

      sig { returns(T.nilable(String)) }
      attr_reader :highlighted_tweets

      sig { params(highlighted_tweets: String).void }
      attr_writer :highlighted_tweets

      sig do
        params(
          can_highlight_tweets: T::Boolean,
          highlighted_tweets: String
        ).returns(T.attached_class)
      end
      def self.new(can_highlight_tweets: nil, highlighted_tweets: nil)
      end

      sig do
        override.returns(
          { can_highlight_tweets: T::Boolean, highlighted_tweets: String }
        )
      end
      def to_hash
      end
    end
  end
end
