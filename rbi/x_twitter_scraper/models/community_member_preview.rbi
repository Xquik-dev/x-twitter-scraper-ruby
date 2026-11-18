# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class CommunityMemberPreview < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::CommunityMemberPreview,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Numeric X user ID of the member
      sig { returns(String) }
      attr_accessor :id

      # Profile picture URL of the member
      sig { returns(T.nilable(String)) }
      attr_reader :profile_picture

      sig { params(profile_picture: String).void }
      attr_writer :profile_picture

      # The member's profile picture at full size
      sig { returns(T.nilable(String)) }
      attr_reader :profile_picture_original

      sig { params(profile_picture_original: String).void }
      attr_writer :profile_picture_original

      sig do
        params(
          id: String,
          profile_picture: String,
          profile_picture_original: String
        ).returns(T.attached_class)
      end
      def self.new(
        # Numeric X user ID of the member
        id:,
        # Profile picture URL of the member
        profile_picture: nil,
        # The member's profile picture at full size
        profile_picture_original: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            profile_picture: String,
            profile_picture_original: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
