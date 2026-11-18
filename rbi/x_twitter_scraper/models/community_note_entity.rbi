# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class CommunityNoteEntity < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::CommunityNoteEntity,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Where it starts in the text.
      sig { returns(T.nilable(Integer)) }
      attr_reader :from_index

      sig { params(from_index: Integer).void }
      attr_writer :from_index

      # Where it ends in the text.
      sig { returns(T.nilable(Integer)) }
      attr_reader :to_index

      sig { params(to_index: Integer).void }
      attr_writer :to_index

      # What it points at.
      sig do
        returns(T.nilable(XTwitterScraper::Models::CommunityNoteEntity::Ref))
      end
      attr_reader :ref

      sig do
        params(
          ref: XTwitterScraper::Models::CommunityNoteEntity::Ref::OrHash
        ).void
      end
      attr_writer :ref

      sig do
        params(
          from_index: Integer,
          to_index: Integer,
          ref: XTwitterScraper::Models::CommunityNoteEntity::Ref::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Where it starts in the text.
        from_index: nil,
        # Where it ends in the text.
        to_index: nil,
        # What it points at.
        ref: nil
      )
      end

      sig do
        override.returns(
          {
            from_index: Integer,
            to_index: Integer,
            ref: XTwitterScraper::Models::CommunityNoteEntity::Ref
          }
        )
      end
      def to_hash
      end

      class Ref < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::CommunityNoteEntity::Ref,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # X's kind, such as TimelineUrl.
        sig { returns(T.nilable(String)) }
        attr_reader :type

        sig { params(type: String).void }
        attr_writer :type

        # The link.
        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        # How X opens the link, such as ExternalUrl.
        sig { returns(T.nilable(String)) }
        attr_reader :url_type

        sig { params(url_type: String).void }
        attr_writer :url_type

        # A hashtag's or cashtag's text.
        sig { returns(T.nilable(String)) }
        attr_reader :text

        sig { params(text: String).void }
        attr_writer :text

        # A mentioned account's username.
        sig { returns(T.nilable(String)) }
        attr_reader :screen_name

        sig { params(screen_name: String).void }
        attr_writer :screen_name

        sig do
          params(
            type: String,
            url: String,
            url_type: String,
            text: String,
            screen_name: String
          ).returns(T.attached_class)
        end
        def self.new(
          # X's kind, such as TimelineUrl.
          type: nil,
          # The link.
          url: nil,
          # How X opens the link, such as ExternalUrl.
          url_type: nil,
          # A hashtag's or cashtag's text.
          text: nil,
          # A mentioned account's username.
          screen_name: nil
        )
        end

        sig do
          override.returns(
            {
              type: String,
              url: String,
              url_type: String,
              text: String,
              screen_name: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
