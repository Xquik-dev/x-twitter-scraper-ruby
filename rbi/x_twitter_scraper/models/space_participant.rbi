# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class SpaceParticipant < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::SpaceParticipant,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(String) }
      attr_accessor :username

      # Name the account shows in the Space
      sig { returns(String) }
      attr_accessor :name

      # Profile picture URL
      sig { returns(T.nilable(String)) }
      attr_reader :profile_picture

      sig { params(profile_picture: String).void }
      attr_writer :profile_picture

      # The participant's profile picture at full size
      sig { returns(T.nilable(String)) }
      attr_reader :profile_picture_original

      sig { params(profile_picture_original: String).void }
      attr_writer :profile_picture_original

      # Whether X shows a verified badge in the Space
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_verified

      sig { params(is_verified: T::Boolean).void }
      attr_writer :is_verified

      # Whether the account has X Premium verification
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_blue_verified

      sig { params(is_blue_verified: T::Boolean).void }
      attr_writer :is_blue_verified

      # Business or Government badge type
      sig { returns(T.nilable(String)) }
      attr_reader :verified_type

      sig { params(verified_type: String).void }
      attr_writer :verified_type

      # Organization affiliation label shown on an X profile.
      sig { returns(T.nilable(XTwitterScraper::Models::UserAffiliateLabel)) }
      attr_reader :affiliates_highlighted_label

      sig do
        params(
          affiliates_highlighted_label:
            XTwitterScraper::Models::UserAffiliateLabel::OrHash
        ).void
      end
      attr_writer :affiliates_highlighted_label

      # When the account joined the Space
      sig { returns(T.nilable(Time)) }
      attr_reader :joined_at

      sig { params(joined_at: Time).void }
      attr_writer :joined_at

      # Whether a host muted the account
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_muted_by_admin

      sig { params(is_muted_by_admin: T::Boolean).void }
      attr_writer :is_muted_by_admin

      # Whether the account muted itself
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_muted_by_guest

      sig { params(is_muted_by_guest: T::Boolean).void }
      attr_writer :is_muted_by_guest

      # The account's ID in X's broadcast service
      sig { returns(T.nilable(String)) }
      attr_reader :periscope_user_id

      sig { params(periscope_user_id: String).void }
      attr_writer :periscope_user_id

      sig do
        params(
          id: String,
          username: String,
          name: String,
          profile_picture: String,
          profile_picture_original: String,
          is_verified: T::Boolean,
          is_blue_verified: T::Boolean,
          verified_type: String,
          affiliates_highlighted_label:
            XTwitterScraper::Models::UserAffiliateLabel::OrHash,
          joined_at: Time,
          is_muted_by_admin: T::Boolean,
          is_muted_by_guest: T::Boolean,
          periscope_user_id: String
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        username:,
        # Name the account shows in the Space
        name:,
        # Profile picture URL
        profile_picture: nil,
        # The participant's profile picture at full size
        profile_picture_original: nil,
        # Whether X shows a verified badge in the Space
        is_verified: nil,
        # Whether the account has X Premium verification
        is_blue_verified: nil,
        # Business or Government badge type
        verified_type: nil,
        # Organization affiliation label shown on an X profile.
        affiliates_highlighted_label: nil,
        # When the account joined the Space
        joined_at: nil,
        # Whether a host muted the account
        is_muted_by_admin: nil,
        # Whether the account muted itself
        is_muted_by_guest: nil,
        # The account's ID in X's broadcast service
        periscope_user_id: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            username: String,
            name: String,
            profile_picture: String,
            profile_picture_original: String,
            is_verified: T::Boolean,
            is_blue_verified: T::Boolean,
            verified_type: String,
            affiliates_highlighted_label:
              XTwitterScraper::Models::UserAffiliateLabel,
            joined_at: Time,
            is_muted_by_admin: T::Boolean,
            is_muted_by_guest: T::Boolean,
            periscope_user_id: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
