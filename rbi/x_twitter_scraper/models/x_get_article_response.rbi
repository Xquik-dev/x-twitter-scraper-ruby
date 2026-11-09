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

        # X's ID for the Article, which differs from its post's ID
        sig { returns(T.nilable(String)) }
        attr_reader :article_id

        sig { params(article_id: String).void }
        attr_writer :article_id

        # Article blocks as Markdown, with headings, lists, bold, italic, links, images &
        # embedded posts as their x.com URLs. Holds no HTML.
        sig { returns(T.nilable(String)) }
        attr_reader :body_markdown

        sig { params(body_markdown: String).void }
        attr_writer :body_markdown

        # Plain text joined from all article blocks
        sig { returns(T.nilable(String)) }
        attr_reader :body_text

        sig { params(body_text: String).void }
        attr_writer :body_text

        # Accounts that bookmarked the Article's post. 0 or more.
        sig { returns(T.nilable(Integer)) }
        attr_reader :bookmark_count

        sig { params(bookmark_count: Integer).void }
        attr_writer :bookmark_count

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

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :cover_media

        sig { params(cover_media: T::Hash[Symbol, T.anything]).void }
        attr_writer :cover_media

        sig { returns(T.nilable(String)) }
        attr_reader :created_at

        sig { params(created_at: String).void }
        attr_writer :created_at

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :lifecycle_state

        sig { params(lifecycle_state: T::Hash[Symbol, T.anything]).void }
        attr_writer :lifecycle_state

        sig { returns(T.nilable(Integer)) }
        attr_reader :like_count

        sig { params(like_count: Integer).void }
        attr_writer :like_count

        sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
        attr_reader :metadata

        sig { params(metadata: T::Hash[Symbol, T.anything]).void }
        attr_writer :metadata

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

        # Reposts of the Article's post. 0 or more.
        sig { returns(T.nilable(Integer)) }
        attr_reader :retweet_count

        sig { params(retweet_count: Integer).void }
        attr_writer :retweet_count

        # X's summary of the Article, when X has one
        sig { returns(T.nilable(String)) }
        attr_reader :summary_text

        sig { params(summary_text: String).void }
        attr_writer :summary_text

        sig { returns(T.nilable(String)) }
        attr_reader :title

        sig { params(title: String).void }
        attr_writer :title

        sig do
          returns(
            T.nilable(
              T::Array[
                XTwitterScraper::Models::XGetArticleResponse::Article::UnknownCount::TaggedSymbol
              ]
            )
          )
        end
        attr_reader :unknown_counts

        sig do
          params(
            unknown_counts:
              T::Array[
                XTwitterScraper::Models::XGetArticleResponse::Article::UnknownCount::OrSymbol
              ]
          ).void
        end
        attr_writer :unknown_counts

        sig { returns(T.nilable(Integer)) }
        attr_reader :view_count

        sig { params(view_count: Integer).void }
        attr_writer :view_count

        sig do
          params(
            article_id: String,
            body_markdown: String,
            body_text: String,
            bookmark_count: Integer,
            contents:
              T::Array[
                XTwitterScraper::Models::XGetArticleResponse::Article::Content::OrHash
              ],
            cover_image_url: String,
            cover_media: T::Hash[Symbol, T.anything],
            created_at: String,
            lifecycle_state: T::Hash[Symbol, T.anything],
            like_count: Integer,
            metadata: T::Hash[Symbol, T.anything],
            preview_text: String,
            quote_count: Integer,
            reply_count: Integer,
            retweet_count: Integer,
            summary_text: String,
            title: String,
            unknown_counts:
              T::Array[
                XTwitterScraper::Models::XGetArticleResponse::Article::UnknownCount::OrSymbol
              ],
            view_count: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # X's ID for the Article, which differs from its post's ID
          article_id: nil,
          # Article blocks as Markdown, with headings, lists, bold, italic, links, images &
          # embedded posts as their x.com URLs. Holds no HTML.
          body_markdown: nil,
          # Plain text joined from all article blocks
          body_text: nil,
          # Accounts that bookmarked the Article's post. 0 or more.
          bookmark_count: nil,
          contents: nil,
          cover_image_url: nil,
          cover_media: nil,
          created_at: nil,
          lifecycle_state: nil,
          like_count: nil,
          metadata: nil,
          preview_text: nil,
          quote_count: nil,
          reply_count: nil,
          # Reposts of the Article's post. 0 or more.
          retweet_count: nil,
          # X's summary of the Article, when X has one
          summary_text: nil,
          title: nil,
          unknown_counts: nil,
          view_count: nil
        )
        end

        sig do
          override.returns(
            {
              article_id: String,
              body_markdown: String,
              body_text: String,
              bookmark_count: Integer,
              contents:
                T::Array[
                  XTwitterScraper::Models::XGetArticleResponse::Article::Content
                ],
              cover_image_url: String,
              cover_media: T::Hash[Symbol, T.anything],
              created_at: String,
              lifecycle_state: T::Hash[Symbol, T.anything],
              like_count: Integer,
              metadata: T::Hash[Symbol, T.anything],
              preview_text: String,
              quote_count: Integer,
              reply_count: Integer,
              retweet_count: Integer,
              summary_text: String,
              title: String,
              unknown_counts:
                T::Array[
                  XTwitterScraper::Models::XGetArticleResponse::Article::UnknownCount::TaggedSymbol
                ],
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

          # Alt text of the image or preview image
          sig { returns(T.nilable(String)) }
          attr_reader :alt_text

          sig { params(alt_text: String).void }
          attr_writer :alt_text

          # Caption the author wrote under a media block
          sig { returns(T.nilable(String)) }
          attr_reader :caption

          sig { params(caption: String).void }
          attr_writer :caption

          # Length of a video, in milliseconds
          sig { returns(T.nilable(Integer)) }
          attr_reader :duration_ms

          sig { params(duration_ms: Integer).void }
          attr_writer :duration_ms

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

          # Links in the block's text, with the text range each covers
          sig do
            returns(
              T.nilable(
                T::Array[
                  XTwitterScraper::Models::XGetArticleResponse::Article::Content::Link
                ]
              )
            )
          end
          attr_reader :links

          sig do
            params(
              links:
                T::Array[
                  XTwitterScraper::Models::XGetArticleResponse::Article::Content::Link::OrHash
                ]
            ).void
          end
          attr_writer :links

          # What a media block holds
          sig do
            returns(
              T.nilable(
                XTwitterScraper::Models::XGetArticleResponse::Article::Content::MediaType::TaggedSymbol
              )
            )
          end
          attr_reader :media_type

          sig do
            params(
              media_type:
                XTwitterScraper::Models::XGetArticleResponse::Article::Content::MediaType::OrSymbol
            ).void
          end
          attr_writer :media_type

          # Preview image URL for media blocks
          sig { returns(T.nilable(String)) }
          attr_reader :preview_url

          sig { params(preview_url: String).void }
          attr_writer :preview_url

          sig { returns(T.nilable(String)) }
          attr_reader :text

          sig { params(text: String).void }
          attr_writer :text

          # ID of the post a tweet block embeds
          sig { returns(T.nilable(String)) }
          attr_reader :tweet_id

          sig { params(tweet_id: String).void }
          attr_writer :tweet_id

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

          # Files of a video or GIF block, in X's order
          sig do
            returns(
              T.nilable(
                T::Array[
                  XTwitterScraper::Models::XGetArticleResponse::Article::Content::Variant
                ]
              )
            )
          end
          attr_reader :variants

          sig do
            params(
              variants:
                T::Array[
                  XTwitterScraper::Models::XGetArticleResponse::Article::Content::Variant::OrHash
                ]
            ).void
          end
          attr_writer :variants

          sig { returns(T.nilable(Integer)) }
          attr_reader :width

          sig { params(width: Integer).void }
          attr_writer :width

          sig do
            params(
              alt_text: String,
              caption: String,
              duration_ms: Integer,
              height: Integer,
              inline_style_ranges:
                T::Array[
                  XTwitterScraper::Models::XGetArticleResponse::Article::Content::InlineStyleRange::OrHash
                ],
              links:
                T::Array[
                  XTwitterScraper::Models::XGetArticleResponse::Article::Content::Link::OrHash
                ],
              media_type:
                XTwitterScraper::Models::XGetArticleResponse::Article::Content::MediaType::OrSymbol,
              preview_url: String,
              text: String,
              tweet_id: String,
              type: String,
              url: String,
              variants:
                T::Array[
                  XTwitterScraper::Models::XGetArticleResponse::Article::Content::Variant::OrHash
                ],
              width: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Alt text of the image or preview image
            alt_text: nil,
            # Caption the author wrote under a media block
            caption: nil,
            # Length of a video, in milliseconds
            duration_ms: nil,
            height: nil,
            # Inline text formatting ranges
            inline_style_ranges: nil,
            # Links in the block's text, with the text range each covers
            links: nil,
            # What a media block holds
            media_type: nil,
            # Preview image URL for media blocks
            preview_url: nil,
            text: nil,
            # ID of the post a tweet block embeds
            tweet_id: nil,
            # Block type: paragraph, header-one, header-two, header-three, header-four,
            # header-five, header-six, unordered-list-item, ordered-list-item, blockquote,
            # code-block, media, divider
            type: nil,
            # Media URL for media blocks
            url: nil,
            # Files of a video or GIF block, in X's order
            variants: nil,
            width: nil
          )
          end

          sig do
            override.returns(
              {
                alt_text: String,
                caption: String,
                duration_ms: Integer,
                height: Integer,
                inline_style_ranges:
                  T::Array[
                    XTwitterScraper::Models::XGetArticleResponse::Article::Content::InlineStyleRange
                  ],
                links:
                  T::Array[
                    XTwitterScraper::Models::XGetArticleResponse::Article::Content::Link
                  ],
                media_type:
                  XTwitterScraper::Models::XGetArticleResponse::Article::Content::MediaType::TaggedSymbol,
                preview_url: String,
                text: String,
                tweet_id: String,
                type: String,
                url: String,
                variants:
                  T::Array[
                    XTwitterScraper::Models::XGetArticleResponse::Article::Content::Variant
                  ],
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

          class Link < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::XGetArticleResponse::Article::Content::Link,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig { returns(T.nilable(Integer)) }
            attr_reader :offset

            sig { params(offset: Integer).void }
            attr_writer :offset

            sig { returns(T.nilable(Integer)) }
            attr_reader :length

            sig { params(length: Integer).void }
            attr_writer :length

            sig { returns(T.nilable(String)) }
            attr_reader :url

            sig { params(url: String).void }
            attr_writer :url

            sig do
              params(offset: Integer, length: Integer, url: String).returns(
                T.attached_class
              )
            end
            def self.new(offset: nil, length: nil, url: nil)
            end

            sig do
              override.returns(
                { offset: Integer, length: Integer, url: String }
              )
            end
            def to_hash
            end
          end

          # What a media block holds
          module MediaType
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::Models::XGetArticleResponse::Article::Content::MediaType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            IMAGE =
              T.let(
                :image,
                XTwitterScraper::Models::XGetArticleResponse::Article::Content::MediaType::TaggedSymbol
              )
            VIDEO =
              T.let(
                :video,
                XTwitterScraper::Models::XGetArticleResponse::Article::Content::MediaType::TaggedSymbol
              )
            GIF =
              T.let(
                :gif,
                XTwitterScraper::Models::XGetArticleResponse::Article::Content::MediaType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Models::XGetArticleResponse::Article::Content::MediaType::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Variant < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::XGetArticleResponse::Article::Content::Variant,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :content_type

            sig { returns(String) }
            attr_accessor :url

            sig { returns(T.nilable(Integer)) }
            attr_reader :bitrate

            sig { params(bitrate: Integer).void }
            attr_writer :bitrate

            sig do
              params(
                content_type: String,
                url: String,
                bitrate: Integer
              ).returns(T.attached_class)
            end
            def self.new(content_type:, url:, bitrate: nil)
            end

            sig do
              override.returns(
                { content_type: String, url: String, bitrate: Integer }
              )
            end
            def to_hash
            end
          end
        end

        module UnknownCount
          extend XTwitterScraper::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                XTwitterScraper::Models::XGetArticleResponse::Article::UnknownCount
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          RETWEET_COUNT =
            T.let(
              :retweetCount,
              XTwitterScraper::Models::XGetArticleResponse::Article::UnknownCount::TaggedSymbol
            )
          REPLY_COUNT =
            T.let(
              :replyCount,
              XTwitterScraper::Models::XGetArticleResponse::Article::UnknownCount::TaggedSymbol
            )
          LIKE_COUNT =
            T.let(
              :likeCount,
              XTwitterScraper::Models::XGetArticleResponse::Article::UnknownCount::TaggedSymbol
            )
          QUOTE_COUNT =
            T.let(
              :quoteCount,
              XTwitterScraper::Models::XGetArticleResponse::Article::UnknownCount::TaggedSymbol
            )
          VIEW_COUNT =
            T.let(
              :viewCount,
              XTwitterScraper::Models::XGetArticleResponse::Article::UnknownCount::TaggedSymbol
            )
          BOOKMARK_COUNT =
            T.let(
              :bookmarkCount,
              XTwitterScraper::Models::XGetArticleResponse::Article::UnknownCount::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                XTwitterScraper::Models::XGetArticleResponse::Article::UnknownCount::TaggedSymbol
              ]
            )
          end
          def self.values
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

        # The same profile picture at full size.
        sig { returns(T.nilable(String)) }
        attr_reader :profile_picture_original

        sig { params(profile_picture_original: String).void }
        attr_writer :profile_picture_original

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
            profile_picture_original: String,
            protected: T::Boolean,
            statuses_count: Integer,
            url: String
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          name:,
          username:,
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
          # The same profile picture at full size.
          profile_picture_original: nil,
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
              profile_picture_original: String,
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
