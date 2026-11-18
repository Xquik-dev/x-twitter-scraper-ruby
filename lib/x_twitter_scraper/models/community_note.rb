# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class CommunityNote < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute id
      #   Note ID.
      #
      #   @return [String]
      required :id, String

      # @!attribute created_at
      #   When the contributor wrote the note.
      #
      #   @return [Time, nil]
      optional :created_at, Time, api_name: :createdAt

      # @!attribute language
      #   Language code of the note.
      #
      #   @return [String, nil]
      optional :language, String

      # @!attribute classification
      #   What the writer says of the post, such as MisinformedOrPotentiallyMisleading or
      #   NotMisleading.
      #
      #   @return [String, nil]
      optional :classification, String

      # @!attribute text
      #   What the note says.
      #
      #   @return [String, nil]
      optional :text, String

      # @!attribute contributor
      #   The note's writer, with the counts X sends beside a note. GET
      #   /x/community-notes/contributors/{alias} serves every count.
      #
      #   @return [XTwitterScraper::Models::CommunityNotesContributor, nil]
      optional :contributor, -> { XTwitterScraper::Models::CommunityNotesContributor }

      # @!attribute entities
      #   Links, tags & accounts inside the text, by character range.
      #
      #   @return [Array<XTwitterScraper::Models::CommunityNoteEntity>, nil]
      optional :entities, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::CommunityNoteEntity] }

      # @!attribute rating_status
      #   X's current rating, such as NeedsMoreRatings, CurrentlyRatedHelpful or
      #   CurrentlyRatedNotHelpful. x.com shows only helpful notes under posts.
      #
      #   @return [String, nil]
      optional :rating_status, String, api_name: :ratingStatus

      # @!attribute helpful_tags
      #   Why raters called the note helpful.
      #
      #   @return [Array<String>, nil]
      optional :helpful_tags, XTwitterScraper::Internal::Type::ArrayOf[String], api_name: :helpfulTags

      # @!attribute not_helpful_tags
      #   Why raters called the note not helpful.
      #
      #   @return [Array<String>, nil]
      optional :not_helpful_tags, XTwitterScraper::Internal::Type::ArrayOf[String], api_name: :notHelpfulTags

      # @!attribute decided_by
      #   The X scoring model that set the rating.
      #
      #   @return [String, nil]
      optional :decided_by, String, api_name: :decidedBy

      # @!attribute fully_visible_model
      #   Whether X marks that scoring model as fully visible.
      #
      #   @return [Boolean, nil]
      optional :fully_visible_model, XTwitterScraper::Internal::Type::Boolean, api_name: :fullyVisibleModel

      # @!attribute above_pcrh_threshold
      #   Whether the note scores above X's bar for a possible helpful rating.
      #
      #   @return [Boolean, nil]
      optional :above_pcrh_threshold, XTwitterScraper::Internal::Type::Boolean, api_name: :abovePcrhThreshold

      # @!attribute appeal_status
      #   Whether the rating is under appeal.
      #
      #   @return [String, nil]
      optional :appeal_status, String, api_name: :appealStatus

      # @!attribute deleted
      #   Whether the writer deleted the note.
      #
      #   @return [Boolean, nil]
      optional :deleted, XTwitterScraper::Internal::Type::Boolean

      # @!attribute tombstone
      #   X's notice in place of a deleted note.
      #
      #   @return [String, nil]
      optional :tombstone, String

      # @!attribute is_api_author
      #   Whether the note came through X's API.
      #
      #   @return [Boolean, nil]
      optional :is_api_author, XTwitterScraper::Internal::Type::Boolean, api_name: :isApiAuthor

      # @!attribute is_media_note
      #   Whether the note is about the post's media. X can show such a note on other
      #   posts.
      #
      #   @return [Boolean, nil]
      optional :is_media_note, XTwitterScraper::Internal::Type::Boolean, api_name: :isMediaNote

      # @!attribute media_note_match_count
      #   Other posts X matched a media note to.
      #
      #   @return [Integer, nil]
      optional :media_note_match_count, Integer, api_name: :mediaNoteMatchCount

      # @!attribute is_url_note
      #   Whether the note is on a link.
      #
      #   @return [Boolean, nil]
      optional :is_url_note, XTwitterScraper::Internal::Type::Boolean, api_name: :isUrlNote

      # @!attribute display_url
      #   The link a link note is on, as X shows it.
      #
      #   @return [String, nil]
      optional :display_url, String, api_name: :displayUrl

      # @!attribute is_translatable
      #   Whether X offers a translation of the note.
      #
      #   @return [Boolean, nil]
      optional :is_translatable, XTwitterScraper::Internal::Type::Boolean, api_name: :isTranslatable

      # @!attribute time_to_helpful_from_note_ms
      #   Milliseconds from the note's creation to its helpful rating.
      #
      #   @return [Integer, nil]
      optional :time_to_helpful_from_note_ms, Integer, api_name: :timeToHelpfulFromNoteMs

      # @!attribute time_to_helpful_from_post_ms
      #   Milliseconds from the post's creation to the note's helpful rating.
      #
      #   @return [Integer, nil]
      optional :time_to_helpful_from_post_ms, Integer, api_name: :timeToHelpfulFromPostMs

      # @!attribute impression_count
      #   Views of the note, when X shares them.
      #
      #   @return [Integer, nil]
      optional :impression_count, Integer, api_name: :impressionCount

      # @!attribute post_id
      #   ID of the post the note is on.
      #
      #   @return [String, nil]
      optional :post_id, String, api_name: :postId

      # @!attribute post
      #   The post the note is on. Null when X no longer shows it.
      #
      #   @return [XTwitterScraper::Models::SearchTweet, nil]
      optional :post, -> { XTwitterScraper::Models::SearchTweet }, nil?: true

      # @!attribute post_unavailable
      #   Why X shows no post, when X says.
      #
      #   @return [XTwitterScraper::Models::CommunityNote::PostUnavailable, nil]
      optional :post_unavailable, -> { XTwitterScraper::Models::CommunityNote::PostUnavailable }, api_name: :postUnavailable

      # @!method initialize(id:, created_at: nil, language: nil, classification: nil, text: nil, contributor: nil, entities: nil, rating_status: nil, helpful_tags: nil, not_helpful_tags: nil, decided_by: nil, fully_visible_model: nil, above_pcrh_threshold: nil, appeal_status: nil, deleted: nil, tombstone: nil, is_api_author: nil, is_media_note: nil, media_note_match_count: nil, is_url_note: nil, display_url: nil, is_translatable: nil, time_to_helpful_from_note_ms: nil, time_to_helpful_from_post_ms: nil, impression_count: nil, post_id: nil, post: nil, post_unavailable: nil)
      #   A Community Note as its writer's page lists it, with the post it is on. A
      #   deleted note has no text, classification or post. A field X leaves out is left
      #   out.
      #
      #   @param id [String] Note ID.
      #
      #   @param created_at [Time] When the contributor wrote the note.
      #
      #   @param language [String] Language code of the note.
      #
      #   @param classification [String] What the writer says of the post, such as MisinformedOrPotentiallyMisleading or NotMisleading.
      #
      #   @param text [String] What the note says.
      #
      #   @param contributor [XTwitterScraper::Models::CommunityNotesContributor] The note's writer, with the counts X sends beside a note. GET /x/community-notes/contributors/{alias} serves every count.
      #
      #   @param entities [Array<XTwitterScraper::Models::CommunityNoteEntity>] Links, tags & accounts inside the text, by character range.
      #
      #   @param rating_status [String] X's current rating, such as NeedsMoreRatings, CurrentlyRatedHelpful or CurrentlyRatedNotHelpful. x.com shows only helpful notes under posts.
      #
      #   @param helpful_tags [Array<String>] Why raters called the note helpful.
      #
      #   @param not_helpful_tags [Array<String>] Why raters called the note not helpful.
      #
      #   @param decided_by [String] The X scoring model that set the rating.
      #
      #   @param fully_visible_model [Boolean] Whether X marks that scoring model as fully visible.
      #
      #   @param above_pcrh_threshold [Boolean] Whether the note scores above X's bar for a possible helpful rating.
      #
      #   @param appeal_status [String] Whether the rating is under appeal.
      #
      #   @param deleted [Boolean] Whether the writer deleted the note.
      #
      #   @param tombstone [String] X's notice in place of a deleted note.
      #
      #   @param is_api_author [Boolean] Whether the note came through X's API.
      #
      #   @param is_media_note [Boolean] Whether the note is about the post's media. X can show such a note on other posts.
      #
      #   @param media_note_match_count [Integer] Other posts X matched a media note to.
      #
      #   @param is_url_note [Boolean] Whether the note is on a link.
      #
      #   @param display_url [String] The link a link note is on, as X shows it.
      #
      #   @param is_translatable [Boolean] Whether X offers a translation of the note.
      #
      #   @param time_to_helpful_from_note_ms [Integer] Milliseconds from the note's creation to its helpful rating.
      #
      #   @param time_to_helpful_from_post_ms [Integer] Milliseconds from the post's creation to the note's helpful rating.
      #
      #   @param impression_count [Integer] Views of the note, when X shares them.
      #
      #   @param post_id [String] ID of the post the note is on.
      #
      #   @param post [XTwitterScraper::Models::SearchTweet, nil] The post the note is on. Null when X no longer shows it.
      #
      #   @param post_unavailable [XTwitterScraper::Models::CommunityNote::PostUnavailable] Why X shows no post, when X says.

      class PostUnavailable < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute reason
        #   Why X shows no post, as X names it.
        #
        #   @return [String]
        required :reason, String

        # @!method initialize(reason:)
        #   Why X shows no post, when X says.
        #
        #   @param reason [String] Why X shows no post, as X names it.
      end
    end
  end
end
