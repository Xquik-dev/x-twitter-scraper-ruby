# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class SearchSuggestionUser < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::SearchSuggestionUser,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # X user ID.
      sig { returns(String) }
      attr_accessor :id

      # Handle without the @.
      sig { returns(String) }
      attr_accessor :username

      # Display name.
      sig { returns(String) }
      attr_accessor :name

      # Whether X shows any verification badge.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :verified

      sig { params(verified: T::Boolean).void }
      attr_writer :verified

      # Whether X shows a blue verification badge.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_blue_verified

      sig { params(is_blue_verified: T::Boolean).void }
      attr_writer :is_blue_verified

      # Whether the account holds X's legacy verification.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_verified

      sig { params(is_verified: T::Boolean).void }
      attr_writer :is_verified

      # Verification category, such as Government or Business. Omitted when X names
      # none.
      sig { returns(T.nilable(String)) }
      attr_reader :verified_type

      sig { params(verified_type: String).void }
      attr_writer :verified_type

      # Whether the account protects its posts.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :protected

      sig { params(protected: T::Boolean).void }
      attr_writer :protected

      # Public profile location text. Omitted when empty.
      sig { returns(T.nilable(String)) }
      attr_reader :location

      sig { params(location: String).void }
      attr_writer :location

      # Avatar URL.
      sig { returns(T.nilable(String)) }
      attr_reader :profile_picture

      sig { params(profile_picture: String).void }
      attr_writer :profile_picture

      # The same avatar at full size.
      sig { returns(T.nilable(String)) }
      attr_reader :profile_picture_original

      sig { params(profile_picture_original: String).void }
      attr_writer :profile_picture_original

      # Affiliation badges X shows beside the name.
      sig do
        returns(
          T.nilable(
            T::Array[XTwitterScraper::Models::SearchSuggestionUser::Badge]
          )
        )
      end
      attr_reader :badges

      sig do
        params(
          badges:
            T::Array[
              XTwitterScraper::Models::SearchSuggestionUser::Badge::OrHash
            ]
        ).void
      end
      attr_writer :badges

      # X's flag for whether media can be generated from this account's persona.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_persona_media_genable

      sig { params(is_persona_media_genable: T::Boolean).void }
      attr_writer :is_persona_media_genable

      # X's rounded relevance score for the account.
      sig { returns(T.nilable(Float)) }
      attr_reader :score

      sig { params(score: Float).void }
      attr_writer :score

      # Normalized text tokens X matches the account by.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :tokens

      sig { params(tokens: T::Array[String]).void }
      attr_writer :tokens

      # X's inline flag for the account.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :inline

      sig { params(inline: T::Boolean).void }
      attr_writer :inline

      sig do
        params(
          id: String,
          username: String,
          name: String,
          verified: T::Boolean,
          is_blue_verified: T::Boolean,
          is_verified: T::Boolean,
          verified_type: String,
          protected: T::Boolean,
          location: String,
          profile_picture: String,
          profile_picture_original: String,
          badges:
            T::Array[
              XTwitterScraper::Models::SearchSuggestionUser::Badge::OrHash
            ],
          is_persona_media_genable: T::Boolean,
          score: Float,
          tokens: T::Array[String],
          inline: T::Boolean
        ).returns(T.attached_class)
      end
      def self.new(
        # X user ID.
        id:,
        # Handle without the @.
        username:,
        # Display name.
        name:,
        # Whether X shows any verification badge.
        verified: nil,
        # Whether X shows a blue verification badge.
        is_blue_verified: nil,
        # Whether the account holds X's legacy verification.
        is_verified: nil,
        # Verification category, such as Government or Business. Omitted when X names
        # none.
        verified_type: nil,
        # Whether the account protects its posts.
        protected: nil,
        # Public profile location text. Omitted when empty.
        location: nil,
        # Avatar URL.
        profile_picture: nil,
        # The same avatar at full size.
        profile_picture_original: nil,
        # Affiliation badges X shows beside the name.
        badges: nil,
        # X's flag for whether media can be generated from this account's persona.
        is_persona_media_genable: nil,
        # X's rounded relevance score for the account.
        score: nil,
        # Normalized text tokens X matches the account by.
        tokens: nil,
        # X's inline flag for the account.
        inline: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            username: String,
            name: String,
            verified: T::Boolean,
            is_blue_verified: T::Boolean,
            is_verified: T::Boolean,
            verified_type: String,
            protected: T::Boolean,
            location: String,
            profile_picture: String,
            profile_picture_original: String,
            badges:
              T::Array[XTwitterScraper::Models::SearchSuggestionUser::Badge],
            is_persona_media_genable: T::Boolean,
            score: Float,
            tokens: T::Array[String],
            inline: T::Boolean
          }
        )
      end
      def to_hash
      end

      class Badge < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::SearchSuggestionUser::Badge,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Kind of badge.
        sig { returns(T.nilable(String)) }
        attr_reader :badge_type

        sig { params(badge_type: String).void }
        attr_writer :badge_type

        # Badge image URL.
        sig { returns(T.nilable(String)) }
        attr_reader :badge_url

        sig { params(badge_url: String).void }
        attr_writer :badge_url

        # Name of the affiliated account.
        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        sig do
          params(
            badge_type: String,
            badge_url: String,
            description: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Kind of badge.
          badge_type: nil,
          # Badge image URL.
          badge_url: nil,
          # Name of the affiliated account.
          description: nil
        )
        end

        sig do
          override.returns(
            { badge_type: String, badge_url: String, description: String }
          )
        end
        def to_hash
        end
      end
    end
  end
end
