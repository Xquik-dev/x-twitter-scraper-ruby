# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    # Type of post monitor event. post.reply.new & post.quote.new fire for each new
    # direct reply & quote. A metric's changed event fires at most once a minute &
    # covers the whole change since the last one. post.edited carries the text before
    # the edit. post.deleted fires once Xquik confirms the author deleted the post.
    module PostEventType
      extend XTwitterScraper::Internal::Type::Enum

      TaggedSymbol =
        T.type_alias { T.all(Symbol, XTwitterScraper::Models::PostEventType) }
      OrSymbol = T.type_alias { T.any(Symbol, String) }

      POST_REPLY_NEW =
        T.let(
          :"post.reply.new",
          XTwitterScraper::Models::PostEventType::TaggedSymbol
        )
      POST_QUOTE_NEW =
        T.let(
          :"post.quote.new",
          XTwitterScraper::Models::PostEventType::TaggedSymbol
        )
      POST_LIKES_CHANGED =
        T.let(
          :"post.likes.changed",
          XTwitterScraper::Models::PostEventType::TaggedSymbol
        )
      POST_RETWEETS_CHANGED =
        T.let(
          :"post.retweets.changed",
          XTwitterScraper::Models::PostEventType::TaggedSymbol
        )
      POST_REPLIES_CHANGED =
        T.let(
          :"post.replies.changed",
          XTwitterScraper::Models::PostEventType::TaggedSymbol
        )
      POST_QUOTES_CHANGED =
        T.let(
          :"post.quotes.changed",
          XTwitterScraper::Models::PostEventType::TaggedSymbol
        )
      POST_BOOKMARKS_CHANGED =
        T.let(
          :"post.bookmarks.changed",
          XTwitterScraper::Models::PostEventType::TaggedSymbol
        )
      POST_VIEWS_CHANGED =
        T.let(
          :"post.views.changed",
          XTwitterScraper::Models::PostEventType::TaggedSymbol
        )
      POST_EDITED =
        T.let(
          :"post.edited",
          XTwitterScraper::Models::PostEventType::TaggedSymbol
        )
      POST_DELETED =
        T.let(
          :"post.deleted",
          XTwitterScraper::Models::PostEventType::TaggedSymbol
        )

      sig do
        override.returns(
          T::Array[XTwitterScraper::Models::PostEventType::TaggedSymbol]
        )
      end
      def self.values
      end
    end
  end
end
