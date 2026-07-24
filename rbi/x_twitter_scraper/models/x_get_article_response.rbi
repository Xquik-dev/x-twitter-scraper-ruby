# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class XGetArticleResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::XGetArticleResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(XTwitterScraper::Models::XGetArticleResponse::Article) }
      attr_reader :article

      sig do
        params(
          article: XTwitterScraper::Models::XGetArticleResponse::Article::OrHash
        ).void
      end
      attr_writer :article

      # X Article author profile fields returned when available.
      sig do
        returns(T.nilable(XTwitterScraper::Models::XGetArticleResponse::Author))
      end
      attr_reader :author

      sig do
        params(
          author: XTwitterScraper::Models::XGetArticleResponse::Author::OrHash
        ).void
      end
      attr_writer :author

      sig do
        params(
          article:
            XTwitterScraper::Models::XGetArticleResponse::Article::OrHash,
          author: XTwitterScraper::Models::XGetArticleResponse::Author::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        article:,
        # X Article author profile fields returned when available.
        author: nil
      )
      end

      sig do
        override.returns(
          {
            article: XTwitterScraper::Models::XGetArticleResponse::Article,
            author: XTwitterScraper::Models::XGetArticleResponse::Author
          }
        )
      end
      def to_hash
      end

      class Article < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::XGetArticleResponse::Article,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Plain text joined from all article blocks
        sig { returns(T.nilable(String)) }
        attr_reader :body_text

        sig { params(body_text: String).void }
        attr_writer :body_text

        sig do
          returns(
            T.nilable(
              T::Array[
                XTwitterScraper::Models::XGetArticleResponse::Article::Content
              ]
            )
          )
        end
        attr_reader :contents

        sig do
          params(
            contents:
              T::Array[
                XTwitterScraper::Models::XGetArticleResponse::Article::Content::OrHash
              ]
          ).void
        end
        attr_writer :contents

        sig { returns(T.nilable(String)) }
        attr_reader :cover_image_url

        sig { params(cover_image_url: String).void }
        attr_writer :cover_image_url

        sig { returns(T.nilable(String)) }
        attr_reader :created_at

        sig { params(created_at: String).void }
        attr_writer :created_at

        sig { returns(T.nilable(Integer)) }
        attr_reader :like_count

        sig { params(like_count: Integer).void }
        attr_writer :like_count

        sig { returns(T.nilable(String)) }
        attr_reader :preview_text

        sig { params(preview_text: String).void }
        attr_writer :preview_text

        sig { returns(T.nilable(Integer)) }
        attr_reader :quote_count

        sig { params(quote_count: Integer).void }
        attr_writer :quote_count

        sig { returns(T.nilable(Integer)) }
        attr_reader :reply_count

        sig { params(reply_count: Integer).void }
        attr_writer :reply_count

        sig { returns(T.nilable(String)) }
        attr_reader :title

        sig { params(title: String).void }
        attr_writer :title

        sig { returns(T.nilable(Integer)) }
        attr_reader :view_count

        sig { params(view_count: Integer).void }
        attr_writer :view_count

        sig do
          params(
            body_text: String,
            contents:
              T::Array[
                XTwitterScraper::Models::XGetArticleResponse::Article::Content::OrHash
              ],
            cover_image_url: String,
            created_at: String,
            like_count: Integer,
            preview_text: String,
            quote_count: Integer,
            reply_count: Integer,
            title: String,
            view_count: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Plain text joined from all article blocks
          body_text: nil,
          contents: nil,
          cover_image_url: nil,
          created_at: nil,
          like_count: nil,
          preview_text: nil,
          quote_count: nil,
          reply_count: nil,
          title: nil,
          view_count: nil
        )
        end

        sig do
          override.returns(
            {
              body_text: String,
              contents:
                T::Array[
                  XTwitterScraper::Models::XGetArticleResponse::Article::Content
                ],
              cover_image_url: String,
              created_at: String,
              like_count: Integer,
              preview_text: String,
              quote_count: Integer,
              reply_count: Integer,
              title: String,
              view_count: Integer
            }
          )
        end
        def to_hash
        end

        class Content < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::XGetArticleResponse::Article::Content,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(T.nilable(Integer)) }
          attr_reader :height

          sig { params(height: Integer).void }
          attr_writer :height

          # Inline text formatting ranges
          sig do
            returns(
              T.nilable(
                T::Array[
                  XTwitterScraper::Models::XGetArticleResponse::Article::Content::InlineStyleRange
                ]
              )
            )
          end
          attr_reader :inline_style_ranges

          sig do
            params(
              inline_style_ranges:
                T::Array[
                  XTwitterScraper::Models::XGetArticleResponse::Article::Content::InlineStyleRange::OrHash
                ]
            ).void
          end
          attr_writer :inline_style_ranges

          # Preview image URL for media blocks
          sig { returns(T.nilable(String)) }
          attr_reader :preview_url

          sig { params(preview_url: String).void }
          attr_writer :preview_url

          sig { returns(T.nilable(String)) }
          attr_reader :text

          sig { params(text: String).void }
          attr_writer :text

          # Block type: paragraph, header-one, header-two, header-three, header-four,
          # header-five, header-six, unordered-list-item, ordered-list-item, blockquote,
          # code-block, media, divider
          sig { returns(T.nilable(String)) }
          attr_reader :type

          sig { params(type: String).void }
          attr_writer :type

          # Media URL for media blocks
          sig { returns(T.nilable(String)) }
          attr_reader :url

          sig { params(url: String).void }
          attr_writer :url

          sig { returns(T.nilable(Integer)) }
          attr_reader :width

          sig { params(width: Integer).void }
          attr_writer :width

          sig do
            params(
              height: Integer,
              inline_style_ranges:
                T::Array[
                  XTwitterScraper::Models::XGetArticleResponse::Article::Content::InlineStyleRange::OrHash
                ],
              preview_url: String,
              text: String,
              type: String,
              url: String,
              width: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            height: nil,
            # Inline text formatting ranges
            inline_style_ranges: nil,
            # Preview image URL for media blocks
            preview_url: nil,
            text: nil,
            # Block type: paragraph, header-one, header-two, header-three, header-four,
            # header-five, header-six, unordered-list-item, ordered-list-item, blockquote,
            # code-block, media, divider
            type: nil,
            # Media URL for media blocks
            url: nil,
            width: nil
          )
          end

          sig do
            override.returns(
              {
                height: Integer,
                inline_style_ranges:
                  T::Array[
                    XTwitterScraper::Models::XGetArticleResponse::Article::Content::InlineStyleRange
                  ],
                preview_url: String,
                text: String,
                type: String,
                url: String,
                width: Integer
              }
            )
          end
          def to_hash
          end

          class InlineStyleRange < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::XGetArticleResponse::Article::Content::InlineStyleRange,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(Integer)) }
            attr_reader :length

            sig { params(length: Integer).void }
            attr_writer :length

            sig { returns(T.nilable(Integer)) }
            attr_reader :offset

            sig { params(offset: Integer).void }
            attr_writer :offset

            sig { returns(T.nilable(String)) }
            attr_reader :style

            sig { params(style: String).void }
            attr_writer :style

            sig do
              params(length: Integer, offset: Integer, style: String).returns(
                T.attached_class
              )
            end
            def self.new(length: nil, offset: nil, style: nil)
            end

            sig do
              override.returns(
                { length: Integer, offset: Integer, style: String }
              )
            end
            def to_hash
            end
          end
        end
      end

      class Author < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::XGetArticleResponse::Author,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :name

        sig { returns(String) }
        attr_accessor :username

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :can_dm

        sig { params(can_dm: T::Boolean).void }
        attr_writer :can_dm

        sig { returns(T.nilable(String)) }
        attr_reader :created_at

        sig { params(created_at: String).void }
        attr_writer :created_at

        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        sig { returns(T.nilable(Integer)) }
        attr_reader :favourites_count

        sig { params(favourites_count: Integer).void }
        attr_writer :favourites_count

        sig { returns(T.nilable(Integer)) }
        attr_reader :followers_count

        sig { params(followers_count: Integer).void }
        attr_writer :followers_count

        sig { returns(T.nilable(Integer)) }
        attr_reader :following_count

        sig { params(following_count: Integer).void }
        attr_writer :following_count

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_blue_verified

        sig { params(is_blue_verified: T::Boolean).void }
        attr_writer :is_blue_verified

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_translator

        sig { params(is_translator: T::Boolean).void }
        attr_writer :is_translator

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_verified

        sig { params(is_verified: T::Boolean).void }
        attr_writer :is_verified

        sig { returns(T.nilable(String)) }
        attr_reader :location

        sig { params(location: String).void }
        attr_writer :location

        sig { returns(T.nilable(Integer)) }
        attr_reader :media_count

        sig { params(media_count: Integer).void }
        attr_writer :media_count

        sig { returns(T.nilable(String)) }
        attr_reader :profile_banner_url

        sig { params(profile_banner_url: String).void }
        attr_writer :profile_banner_url

        sig { returns(T.nilable(String)) }
        attr_reader :profile_picture

        sig { params(profile_picture: String).void }
        attr_writer :profile_picture

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :protected

        sig { params(protected: T::Boolean).void }
        attr_writer :protected

        sig { returns(T.nilable(Integer)) }
        attr_reader :statuses_count

        sig { params(statuses_count: Integer).void }
        attr_writer :statuses_count

        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        # X Article author profile fields returned when available.
        sig do
          params(
            id: String,
            name: String,
            username: String,
            can_dm: T::Boolean,
            created_at: String,
            description: String,
            favourites_count: Integer,
            followers_count: Integer,
            following_count: Integer,
            is_blue_verified: T::Boolean,
            is_translator: T::Boolean,
            is_verified: T::Boolean,
            location: String,
            media_count: Integer,
            profile_banner_url: String,
            profile_picture: String,
            protected: T::Boolean,
            statuses_count: Integer,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          name:,
          username:,
          can_dm: nil,
          created_at: nil,
          description: nil,
          favourites_count: nil,
          followers_count: nil,
          following_count: nil,
          is_blue_verified: nil,
          is_translator: nil,
          is_verified: nil,
          location: nil,
          media_count: nil,
          profile_banner_url: nil,
          profile_picture: nil,
          protected: nil,
          statuses_count: nil,
          url: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              name: String,
              username: String,
              can_dm: T::Boolean,
              created_at: String,
              description: String,
              favourites_count: Integer,
              followers_count: Integer,
              following_count: Integer,
              is_blue_verified: T::Boolean,
              is_translator: T::Boolean,
              is_verified: T::Boolean,
              location: String,
              media_count: Integer,
              profile_banner_url: String,
              profile_picture: String,
              protected: T::Boolean,
              statuses_count: Integer,
              url: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
