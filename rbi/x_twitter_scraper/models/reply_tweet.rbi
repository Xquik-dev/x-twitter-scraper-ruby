# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class ReplyTweet < XTwitterScraper::Models::SearchTweet
      OrHash =
        T.type_alias do
          T.any(XTwitterScraper::ReplyTweet, XTwitterScraper::Internal::AnyHash)
        end

      # Present on a reply the post's author hid. Complete-mode replies carry it when
      # includeHidden asks for them.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :hidden_by_author

      sig { params(hidden_by_author: T::Boolean).void }
      attr_writer :hidden_by_author

      # Reply row. A reply the post's author hid carries hiddenByAuthor.
      sig { params(hidden_by_author: T::Boolean).returns(T.attached_class) }
      def self.new(
        # Present on a reply the post's author hid. Complete-mode replies carry it when
        # includeHidden asks for them.
        hidden_by_author: nil
      )
      end

      sig { override.returns({ hidden_by_author: T::Boolean }) }
      def to_hash
      end
    end
  end
end
