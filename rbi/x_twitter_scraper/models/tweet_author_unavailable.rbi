# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class TweetAuthorUnavailable < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::TweetAuthorUnavailable,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # X's reason code.
      sig { returns(String) }
      attr_accessor :reason

      # X's notice text for the reason.
      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      # Why the tweet has no author. X serves a suspended or deleted account as an
      # unavailable user with a reason such as Suspended or NotFound. Omitted when the
      # author is available.
      sig { params(reason: String, message: String).returns(T.attached_class) }
      def self.new(
        # X's reason code.
        reason:,
        # X's notice text for the reason.
        message: nil
      )
      end

      sig { override.returns({ reason: String, message: String }) }
      def to_hash
      end
    end
  end
end
