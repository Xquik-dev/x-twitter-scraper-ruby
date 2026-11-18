# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class CommunityMemberPreview < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   Numeric X user ID of the member
      #
      #   @return [String]
      required :id, String

      # @!attribute profile_picture
      #   Profile picture URL of the member
      #
      #   @return [String, nil]
      optional :profile_picture, String, api_name: :profilePicture

      # @!attribute profile_picture_original
      #   The member's profile picture at full size
      #
      #   @return [String, nil]
      optional :profile_picture_original, String, api_name: :profilePictureOriginal

      # @!method initialize(id:, profile_picture: nil, profile_picture_original: nil)
      #   A member X previews by ID & profile picture only.
      #
      #   @param id [String] Numeric X user ID of the member
      #
      #   @param profile_picture [String] Profile picture URL of the member
      #
      #   @param profile_picture_original [String] The member's profile picture at full size
    end
  end
end
