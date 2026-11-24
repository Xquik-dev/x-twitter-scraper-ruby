# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class CommunityUnavailable < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::CommunityUnavailable,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # X's reason, as X writes it.
      sig { returns(String) }
      attr_accessor :reason

      # Why X shows no Community for the post. Omitted when X names no reason.
      sig { params(reason: String).returns(T.attached_class) }
      def self.new(
        # X's reason, as X writes it.
        reason:
      )
      end

      sig { override.returns({ reason: String }) }
      def to_hash
      end
    end
  end
end
