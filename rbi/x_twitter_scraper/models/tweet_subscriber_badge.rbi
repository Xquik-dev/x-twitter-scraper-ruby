# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class TweetSubscriberBadge < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::TweetSubscriberBadge,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Account ID of the creator the author subscribes to.
      sig { returns(String) }
      attr_accessor :creator_id

      # The Subscriber badge X shows on a reply. The reply's author subscribes to the
      # creator who started the conversation. Omitted on a post without the badge.
      sig { params(creator_id: String).returns(T.attached_class) }
      def self.new(
        # Account ID of the creator the author subscribes to.
        creator_id:
      )
      end

      sig { override.returns({ creator_id: String }) }
      def to_hash
      end
    end
  end
end
