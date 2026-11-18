# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class CommunityNote < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::CommunityNote,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Note ID.
      sig { returns(String) }
      attr_accessor :id

      # When the contributor wrote the note.
      sig { returns(T.nilable(Time)) }
      attr_reader :created_at

      sig { params(created_at: Time).void }
      attr_writer :created_at

      # Language code of the note.
      sig { returns(T.nilable(String)) }
      attr_reader :language

      sig { params(language: String).void }
      attr_writer :language

      # What the writer says of the post, such as MisinformedOrPotentiallyMisleading or
      # NotMisleading.
      sig { returns(T.nilable(String)) }
      attr_reader :classification

      sig { params(classification: String).void }
      attr_writer :classification

      # What the note says.
      sig { returns(T.nilable(String)) }
      attr_reader :text

      sig { params(text: String).void }
      attr_writer :text

      # The note's writer, with the counts X sends beside a note. GET
      # /x/community-notes/contributors/{alias} serves every count.
      sig do
        returns(T.nilable(XTwitterScraper::Models::CommunityNotesContributor))
      end
      attr_reader :contributor

      sig do
        params(
          contributor:
            XTwitterScraper::Models::CommunityNotesContributor::OrHash
        ).void
      end
      attr_writer :contributor

      # Links, tags & accounts inside the text, by character range.
      sig do
        returns(
          T.nilable(T::Array[XTwitterScraper::Models::CommunityNoteEntity])
        )
      end
      attr_reader :entities

      sig do
        params(
          entities:
            T::Array[XTwitterScraper::Models::CommunityNoteEntity::OrHash]
        ).void
      end
      attr_writer :entities

      # X's current rating, such as NeedsMoreRatings, CurrentlyRatedHelpful or
      # CurrentlyRatedNotHelpful. x.com shows only helpful notes under posts.
      sig { returns(T.nilable(String)) }
      attr_reader :rating_status

      sig { params(rating_status: String).void }
      attr_writer :rating_status

      # Why raters called the note helpful.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :helpful_tags

      sig { params(helpful_tags: T::Array[String]).void }
      attr_writer :helpful_tags

      # Why raters called the note not helpful.
      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :not_helpful_tags

      sig { params(not_helpful_tags: T::Array[String]).void }
      attr_writer :not_helpful_tags

      # The X scoring model that set the rating.
      sig { returns(T.nilable(String)) }
      attr_reader :decided_by

      sig { params(decided_by: String).void }
      attr_writer :decided_by

      # Whether X marks that scoring model as fully visible.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :fully_visible_model

      sig { params(fully_visible_model: T::Boolean).void }
      attr_writer :fully_visible_model

      # Whether the note scores above X's bar for a possible helpful rating.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :above_pcrh_threshold

      sig { params(above_pcrh_threshold: T::Boolean).void }
      attr_writer :above_pcrh_threshold

      # Whether the rating is under appeal.
      sig { returns(T.nilable(String)) }
      attr_reader :appeal_status

      sig { params(appeal_status: String).void }
      attr_writer :appeal_status

      # Whether the writer deleted the note.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :deleted

      sig { params(deleted: T::Boolean).void }
      attr_writer :deleted

      # X's notice in place of a deleted note.
      sig { returns(T.nilable(String)) }
      attr_reader :tombstone

      sig { params(tombstone: String).void }
      attr_writer :tombstone

      # Whether the note came through X's API.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_api_author

      sig { params(is_api_author: T::Boolean).void }
      attr_writer :is_api_author

      # Whether the note is about the post's media. X can show such a note on other
      # posts.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_media_note

      sig { params(is_media_note: T::Boolean).void }
      attr_writer :is_media_note

      # Other posts X matched a media note to.
      sig { returns(T.nilable(Integer)) }
      attr_reader :media_note_match_count

      sig { params(media_note_match_count: Integer).void }
      attr_writer :media_note_match_count

      # Whether the note is on a link.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_url_note

      sig { params(is_url_note: T::Boolean).void }
      attr_writer :is_url_note

      # The link a link note is on, as X shows it.
      sig { returns(T.nilable(String)) }
      attr_reader :display_url

      sig { params(display_url: String).void }
      attr_writer :display_url

      # Whether X offers a translation of the note.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_translatable

      sig { params(is_translatable: T::Boolean).void }
      attr_writer :is_translatable

      # Milliseconds from the note's creation to its helpful rating.
      sig { returns(T.nilable(Integer)) }
      attr_reader :time_to_helpful_from_note_ms

      sig { params(time_to_helpful_from_note_ms: Integer).void }
      attr_writer :time_to_helpful_from_note_ms

      # Milliseconds from the post's creation to the note's helpful rating.
      sig { returns(T.nilable(Integer)) }
      attr_reader :time_to_helpful_from_post_ms

      sig { params(time_to_helpful_from_post_ms: Integer).void }
      attr_writer :time_to_helpful_from_post_ms

      # Views of the note, when X shares them.
      sig { returns(T.nilable(Integer)) }
      attr_reader :impression_count

      sig { params(impression_count: Integer).void }
      attr_writer :impression_count

      # ID of the post the note is on.
      sig { returns(T.nilable(String)) }
      attr_reader :post_id

      sig { params(post_id: String).void }
      attr_writer :post_id

      # The post the note is on. Null when X no longer shows it.
      sig { returns(T.nilable(XTwitterScraper::Models::SearchTweet)) }
      attr_reader :post

      sig do
        params(
          post: T.nilable(XTwitterScraper::Models::SearchTweet::OrHash)
        ).void
      end
      attr_writer :post

      # Why X shows no post, when X says.
      sig do
        returns(
          T.nilable(XTwitterScraper::Models::CommunityNote::PostUnavailable)
        )
      end
      attr_reader :post_unavailable

      sig do
        params(
          post_unavailable:
            XTwitterScraper::Models::CommunityNote::PostUnavailable::OrHash
        ).void
      end
      attr_writer :post_unavailable

      sig do
        params(
          id: String,
          created_at: Time,
          language: String,
          classification: String,
          text: String,
          contributor:
            XTwitterScraper::Models::CommunityNotesContributor::OrHash,
          entities:
            T::Array[XTwitterScraper::Models::CommunityNoteEntity::OrHash],
          rating_status: String,
          helpful_tags: T::Array[String],
          not_helpful_tags: T::Array[String],
          decided_by: String,
          fully_visible_model: T::Boolean,
          above_pcrh_threshold: T::Boolean,
          appeal_status: String,
          deleted: T::Boolean,
          tombstone: String,
          is_api_author: T::Boolean,
          is_media_note: T::Boolean,
          media_note_match_count: Integer,
          is_url_note: T::Boolean,
          display_url: String,
          is_translatable: T::Boolean,
          time_to_helpful_from_note_ms: Integer,
          time_to_helpful_from_post_ms: Integer,
          impression_count: Integer,
          post_id: String,
          post: T.nilable(XTwitterScraper::Models::SearchTweet::OrHash),
          post_unavailable:
            XTwitterScraper::Models::CommunityNote::PostUnavailable::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Note ID.
        id:,
        # When the contributor wrote the note.
        created_at: nil,
        # Language code of the note.
        language: nil,
        # What the writer says of the post, such as MisinformedOrPotentiallyMisleading or
        # NotMisleading.
        classification: nil,
        # What the note says.
        text: nil,
        # The note's writer, with the counts X sends beside a note. GET
        # /x/community-notes/contributors/{alias} serves every count.
        contributor: nil,
        # Links, tags & accounts inside the text, by character range.
        entities: nil,
        # X's current rating, such as NeedsMoreRatings, CurrentlyRatedHelpful or
        # CurrentlyRatedNotHelpful. x.com shows only helpful notes under posts.
        rating_status: nil,
        # Why raters called the note helpful.
        helpful_tags: nil,
        # Why raters called the note not helpful.
        not_helpful_tags: nil,
        # The X scoring model that set the rating.
        decided_by: nil,
        # Whether X marks that scoring model as fully visible.
        fully_visible_model: nil,
        # Whether the note scores above X's bar for a possible helpful rating.
        above_pcrh_threshold: nil,
        # Whether the rating is under appeal.
        appeal_status: nil,
        # Whether the writer deleted the note.
        deleted: nil,
        # X's notice in place of a deleted note.
        tombstone: nil,
        # Whether the note came through X's API.
        is_api_author: nil,
        # Whether the note is about the post's media. X can show such a note on other
        # posts.
        is_media_note: nil,
        # Other posts X matched a media note to.
        media_note_match_count: nil,
        # Whether the note is on a link.
        is_url_note: nil,
        # The link a link note is on, as X shows it.
        display_url: nil,
        # Whether X offers a translation of the note.
        is_translatable: nil,
        # Milliseconds from the note's creation to its helpful rating.
        time_to_helpful_from_note_ms: nil,
        # Milliseconds from the post's creation to the note's helpful rating.
        time_to_helpful_from_post_ms: nil,
        # Views of the note, when X shares them.
        impression_count: nil,
        # ID of the post the note is on.
        post_id: nil,
        # The post the note is on. Null when X no longer shows it.
        post: nil,
        # Why X shows no post, when X says.
        post_unavailable: nil
      )
      end

      sig do
        override.returns(
          {
            id: String,
            created_at: Time,
            language: String,
            classification: String,
            text: String,
            contributor: XTwitterScraper::Models::CommunityNotesContributor,
            entities: T::Array[XTwitterScraper::Models::CommunityNoteEntity],
            rating_status: String,
            helpful_tags: T::Array[String],
            not_helpful_tags: T::Array[String],
            decided_by: String,
            fully_visible_model: T::Boolean,
            above_pcrh_threshold: T::Boolean,
            appeal_status: String,
            deleted: T::Boolean,
            tombstone: String,
            is_api_author: T::Boolean,
            is_media_note: T::Boolean,
            media_note_match_count: Integer,
            is_url_note: T::Boolean,
            display_url: String,
            is_translatable: T::Boolean,
            time_to_helpful_from_note_ms: Integer,
            time_to_helpful_from_post_ms: Integer,
            impression_count: Integer,
            post_id: String,
            post: XTwitterScraper::Models::SearchTweet,
            post_unavailable:
              XTwitterScraper::Models::CommunityNote::PostUnavailable
          }
        )
      end
      def to_hash
      end

      class PostUnavailable < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::CommunityNote::PostUnavailable,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Why X shows no post, as X names it.
        sig { returns(String) }
        attr_accessor :reason

        sig { params(reason: String).returns(T.attached_class) }
        def self.new(
          # Why X shows no post, as X names it.
          reason:
        )
        end

        sig { override.returns({ reason: String }) }
        def to_hash
        end
      end
    end
  end
end
