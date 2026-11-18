# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class CommunityNotesContributor < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::CommunityNotesContributor,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # The alias X gives the contributor.
      sig { returns(String) }
      attr_accessor :alias_

      # Whether X marks the contributor as a top writer.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_top_writer

      sig { params(is_top_writer: T::Boolean).void }
      attr_writer :is_top_writer

      # Whether the contributor writes notes through X's API.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_api_contributor

      sig { params(is_api_contributor: T::Boolean).void }
      attr_writer :is_api_contributor

      # Notes the contributor deleted.
      sig { returns(T.nilable(Integer)) }
      attr_reader :deleted_notes_count

      sig { params(deleted_notes_count: Integer).void }
      attr_writer :deleted_notes_count

      # How many notes a contributor wrote, by X's current rating.
      sig do
        returns(T.nilable(XTwitterScraper::Models::CommunityNotesNoteCounts))
      end
      attr_reader :notes_count

      sig do
        params(
          notes_count: XTwitterScraper::Models::CommunityNotesNoteCounts::OrHash
        ).void
      end
      attr_writer :notes_count

      # How a contributor's ratings of other notes went.
      sig do
        returns(T.nilable(XTwitterScraper::Models::CommunityNotesRatingCounts))
      end
      attr_reader :ratings_count

      sig do
        params(
          ratings_count:
            XTwitterScraper::Models::CommunityNotesRatingCounts::OrHash
        ).void
      end
      attr_writer :ratings_count

      sig do
        params(
          alias_: String,
          is_top_writer: T::Boolean,
          is_api_contributor: T::Boolean,
          deleted_notes_count: Integer,
          notes_count:
            XTwitterScraper::Models::CommunityNotesNoteCounts::OrHash,
          ratings_count:
            XTwitterScraper::Models::CommunityNotesRatingCounts::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The alias X gives the contributor.
        alias_:,
        # Whether X marks the contributor as a top writer.
        is_top_writer: nil,
        # Whether the contributor writes notes through X's API.
        is_api_contributor: nil,
        # Notes the contributor deleted.
        deleted_notes_count: nil,
        # How many notes a contributor wrote, by X's current rating.
        notes_count: nil,
        # How a contributor's ratings of other notes went.
        ratings_count: nil
      )
      end

      sig do
        override.returns(
          {
            alias_: String,
            is_top_writer: T::Boolean,
            is_api_contributor: T::Boolean,
            deleted_notes_count: Integer,
            notes_count: XTwitterScraper::Models::CommunityNotesNoteCounts,
            ratings_count: XTwitterScraper::Models::CommunityNotesRatingCounts
          }
        )
      end
      def to_hash
      end
    end
  end
end
