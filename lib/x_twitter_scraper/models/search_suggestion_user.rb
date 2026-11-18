# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class SearchSuggestionUser < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   X user ID.
      #
      #   @return [String]
      required :id, String

      # @!attribute username
      #   Handle without the @.
      #
      #   @return [String]
      required :username, String

      # @!attribute name
      #   Display name.
      #
      #   @return [String]
      required :name, String

      # @!attribute verified
      #   Whether X shows any verification badge.
      #
      #   @return [Boolean, nil]
      optional :verified, XTwitterScraper::Internal::Type::Boolean

      # @!attribute is_blue_verified
      #   Whether X shows a blue verification badge.
      #
      #   @return [Boolean, nil]
      optional :is_blue_verified, XTwitterScraper::Internal::Type::Boolean, api_name: :isBlueVerified

      # @!attribute is_verified
      #   Whether the account holds X's legacy verification.
      #
      #   @return [Boolean, nil]
      optional :is_verified, XTwitterScraper::Internal::Type::Boolean, api_name: :isVerified

      # @!attribute verified_type
      #   Verification category, such as Government or Business. Omitted when X names
      #   none.
      #
      #   @return [String, nil]
      optional :verified_type, String, api_name: :verifiedType

      # @!attribute protected
      #   Whether the account protects its posts.
      #
      #   @return [Boolean, nil]
      optional :protected, XTwitterScraper::Internal::Type::Boolean

      # @!attribute location
      #   Public profile location text. Omitted when empty.
      #
      #   @return [String, nil]
      optional :location, String

      # @!attribute profile_picture
      #   Avatar URL.
      #
      #   @return [String, nil]
      optional :profile_picture, String, api_name: :profilePicture

      # @!attribute profile_picture_original
      #   The same avatar at full size.
      #
      #   @return [String, nil]
      optional :profile_picture_original, String, api_name: :profilePictureOriginal

      # @!attribute badges
      #   Affiliation badges X shows beside the name.
      #
      #   @return [Array<XTwitterScraper::Models::SearchSuggestionUser::Badge>, nil]
      optional :badges, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::SearchSuggestionUser::Badge] }

      # @!attribute is_persona_media_genable
      #   X's flag for whether media can be generated from this account's persona.
      #
      #   @return [Boolean, nil]
      optional :is_persona_media_genable,
               XTwitterScraper::Internal::Type::Boolean,
               api_name: :isPersonaMediaGenable

      # @!attribute score
      #   X's rounded relevance score for the account.
      #
      #   @return [Float, nil]
      optional :score, Float

      # @!attribute tokens
      #   Normalized text tokens X matches the account by.
      #
      #   @return [Array<String>, nil]
      optional :tokens, XTwitterScraper::Internal::Type::ArrayOf[String]

      # @!attribute inline
      #   X's inline flag for the account.
      #
      #   @return [Boolean, nil]
      optional :inline, XTwitterScraper::Internal::Type::Boolean

      # @!method initialize(id:, username:, name:, verified: nil, is_blue_verified: nil, is_verified: nil, verified_type: nil, protected: nil, location: nil, profile_picture: nil, profile_picture_original: nil, badges: nil, is_persona_media_genable: nil, score: nil, tokens: nil, inline: nil)
      #   An account X suggests for the query.
      #
      #   @param id [String] X user ID.
      #
      #   @param username [String] Handle without the @.
      #
      #   @param name [String] Display name.
      #
      #   @param verified [Boolean] Whether X shows any verification badge.
      #
      #   @param is_blue_verified [Boolean] Whether X shows a blue verification badge.
      #
      #   @param is_verified [Boolean] Whether the account holds X's legacy verification.
      #
      #   @param verified_type [String] Verification category, such as Government or Business. Omitted when X names none.
      #
      #   @param protected [Boolean] Whether the account protects its posts.
      #
      #   @param location [String] Public profile location text. Omitted when empty.
      #
      #   @param profile_picture [String] Avatar URL.
      #
      #   @param profile_picture_original [String] The same avatar at full size.
      #
      #   @param badges [Array<XTwitterScraper::Models::SearchSuggestionUser::Badge>] Affiliation badges X shows beside the name.
      #
      #   @param is_persona_media_genable [Boolean] X's flag for whether media can be generated from this account's persona.
      #
      #   @param score [Float] X's rounded relevance score for the account.
      #
      #   @param tokens [Array<String>] Normalized text tokens X matches the account by.
      #
      #   @param inline [Boolean] X's inline flag for the account.

      class Badge < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute badge_type
        #   Kind of badge.
        #
        #   @return [String, nil]
        optional :badge_type, String, api_name: :badgeType

        # @!attribute badge_url
        #   Badge image URL.
        #
        #   @return [String, nil]
        optional :badge_url, String, api_name: :badgeUrl

        # @!attribute description
        #   Name of the affiliated account.
        #
        #   @return [String, nil]
        optional :description, String

        # @!method initialize(badge_type: nil, badge_url: nil, description: nil)
        #   1 affiliation badge.
        #
        #   @param badge_type [String] Kind of badge.
        #
        #   @param badge_url [String] Badge image URL.
        #
        #   @param description [String] Name of the affiliated account.
      end
    end
  end
end
