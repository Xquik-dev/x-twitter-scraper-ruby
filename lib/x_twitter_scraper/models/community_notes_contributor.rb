# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class CommunityNotesContributor < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute alias_
      #   The alias X gives the contributor.
      #
      #   @return [String]
      required :alias_, String, api_name: :alias

      # @!attribute is_top_writer
      #   Whether X marks the contributor as a top writer.
      #
      #   @return [Boolean, nil]
      optional :is_top_writer, XTwitterScraper::Internal::Type::Boolean, api_name: :isTopWriter

      # @!attribute is_api_contributor
      #   Whether the contributor writes notes through X's API.
      #
      #   @return [Boolean, nil]
      optional :is_api_contributor, XTwitterScraper::Internal::Type::Boolean, api_name: :isApiContributor

      # @!attribute deleted_notes_count
      #   Notes the contributor deleted.
      #
      #   @return [Integer, nil]
      optional :deleted_notes_count, Integer, api_name: :deletedNotesCount

      # @!attribute notes_count
      #   How many notes a contributor wrote, by X's current rating.
      #
      #   @return [XTwitterScraper::Models::CommunityNotesNoteCounts, nil]
      optional :notes_count, -> { XTwitterScraper::Models::CommunityNotesNoteCounts }, api_name: :notesCount

      # @!attribute ratings_count
      #   How a contributor's ratings of other notes went.
      #
      #   @return [XTwitterScraper::Models::CommunityNotesRatingCounts, nil]
      optional :ratings_count, -> { XTwitterScraper::Models::CommunityNotesRatingCounts }, api_name: :ratingsCount

      # @!method initialize(alias_:, is_top_writer: nil, is_api_contributor: nil, deleted_notes_count: nil, notes_count: nil, ratings_count: nil)
      #   A Community Notes contributor. X names contributors by an alias, never by their
      #   X account. A field X leaves out is left out. Beside a note, X sends its writer
      #   with only some of the counts.
      #
      #   @param alias_ [String] The alias X gives the contributor.
      #
      #   @param is_top_writer [Boolean] Whether X marks the contributor as a top writer.
      #
      #   @param is_api_contributor [Boolean] Whether the contributor writes notes through X's API.
      #
      #   @param deleted_notes_count [Integer] Notes the contributor deleted.
      #
      #   @param notes_count [XTwitterScraper::Models::CommunityNotesNoteCounts] How many notes a contributor wrote, by X's current rating.
      #
      #   @param ratings_count [XTwitterScraper::Models::CommunityNotesRatingCounts] How a contributor's ratings of other notes went.
    end
  end
end
