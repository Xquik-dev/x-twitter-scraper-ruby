# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class SpaceParticipant < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute username
      #
      #   @return [String]
      required :username, String

      # @!attribute name
      #   Name the account shows in the Space
      #
      #   @return [String]
      required :name, String

      # @!attribute profile_picture
      #   Profile picture URL
      #
      #   @return [String, nil]
      optional :profile_picture, String, api_name: :profilePicture

      # @!attribute profile_picture_original
      #   The participant's profile picture at full size
      #
      #   @return [String, nil]
      optional :profile_picture_original, String, api_name: :profilePictureOriginal

      # @!attribute is_verified
      #   Whether X shows a verified badge in the Space
      #
      #   @return [Boolean, nil]
      optional :is_verified, XTwitterScraper::Internal::Type::Boolean, api_name: :isVerified

      # @!attribute is_blue_verified
      #   Whether the account has X Premium verification
      #
      #   @return [Boolean, nil]
      optional :is_blue_verified, XTwitterScraper::Internal::Type::Boolean, api_name: :isBlueVerified

      # @!attribute verified_type
      #   Business or Government badge type
      #
      #   @return [String, nil]
      optional :verified_type, String, api_name: :verifiedType

      # @!attribute affiliates_highlighted_label
      #   Organization affiliation label shown on an X profile.
      #
      #   @return [XTwitterScraper::Models::UserAffiliateLabel, nil]
      optional :affiliates_highlighted_label, -> { XTwitterScraper::Models::UserAffiliateLabel }, api_name: :affiliatesHighlightedLabel

      # @!attribute joined_at
      #   When the account joined the Space
      #
      #   @return [Time, nil]
      optional :joined_at, Time, api_name: :joinedAt

      # @!attribute is_muted_by_admin
      #   Whether a host muted the account
      #
      #   @return [Boolean, nil]
      optional :is_muted_by_admin, XTwitterScraper::Internal::Type::Boolean, api_name: :isMutedByAdmin

      # @!attribute is_muted_by_guest
      #   Whether the account muted itself
      #
      #   @return [Boolean, nil]
      optional :is_muted_by_guest, XTwitterScraper::Internal::Type::Boolean, api_name: :isMutedByGuest

      # @!attribute periscope_user_id
      #   The account's ID in X's broadcast service
      #
      #   @return [String, nil]
      optional :periscope_user_id, String, api_name: :periscopeUserId

      # @!method initialize(id:, username:, name:, profile_picture: nil, profile_picture_original: nil, is_verified: nil, is_blue_verified: nil, verified_type: nil, affiliates_highlighted_label: nil, joined_at: nil, is_muted_by_admin: nil, is_muted_by_guest: nil, periscope_user_id: nil)
      #   An account on a Space's stage or in its audience, as X lists it there.
      #
      #   @param id [String]
      #
      #   @param username [String]
      #
      #   @param name [String] Name the account shows in the Space
      #
      #   @param profile_picture [String] Profile picture URL
      #
      #   @param profile_picture_original [String] The participant's profile picture at full size
      #
      #   @param is_verified [Boolean] Whether X shows a verified badge in the Space
      #
      #   @param is_blue_verified [Boolean] Whether the account has X Premium verification
      #
      #   @param verified_type [String] Business or Government badge type
      #
      #   @param affiliates_highlighted_label [XTwitterScraper::Models::UserAffiliateLabel] Organization affiliation label shown on an X profile.
      #
      #   @param joined_at [Time] When the account joined the Space
      #
      #   @param is_muted_by_admin [Boolean] Whether a host muted the account
      #
      #   @param is_muted_by_guest [Boolean] Whether the account muted itself
      #
      #   @param periscope_user_id [String] The account's ID in X's broadcast service
    end
  end
end
