# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::X#get_article
    class XGetArticleResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute article
      #
      #   @return [XTwitterScraper::Models::XGetArticleResponse::Article]
      required :article, -> { XTwitterScraper::Models::XGetArticleResponse::Article }

      # @!attribute author
      #   X Article author profile fields returned when available.
      #
      #   @return [XTwitterScraper::Models::XGetArticleResponse::Author, nil]
      optional :author, -> { XTwitterScraper::Models::XGetArticleResponse::Author }

      # @!method initialize(article:, author: nil)
      #   @param article [XTwitterScraper::Models::XGetArticleResponse::Article]
      #
      #   @param author [XTwitterScraper::Models::XGetArticleResponse::Author] X Article author profile fields returned when available.

      # @see XTwitterScraper::Models::XGetArticleResponse#article
      class Article < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute article_id
        #   X's ID for the Article, which differs from its post's ID
        #
        #   @return [String, nil]
        optional :article_id, String, api_name: :articleId

        # @!attribute body_markdown
        #   Article blocks as Markdown, with headings, lists, bold, italic, links, images &
        #   embedded posts as their x.com URLs. Holds no HTML.
        #
        #   @return [String, nil]
        optional :body_markdown, String, api_name: :bodyMarkdown

        # @!attribute body_text
        #   Plain text joined from all article blocks
        #
        #   @return [String, nil]
        optional :body_text, String, api_name: :bodyText

        # @!attribute bookmark_count
        #   Accounts that bookmarked the Article's post. 0 or more.
        #
        #   @return [Integer, nil]
        optional :bookmark_count, Integer, api_name: :bookmarkCount

        # @!attribute contents
        #
        #   @return [Array<XTwitterScraper::Models::XGetArticleResponse::Article::Content>, nil]
        optional :contents,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::XGetArticleResponse::Article::Content] }

        # @!attribute cover_image_url
        #
        #   @return [String, nil]
        optional :cover_image_url, String, api_name: :coverImageUrl

        # @!attribute cover_media
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :cover_media,
                 XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown],
                 api_name: :coverMedia

        # @!attribute created_at
        #
        #   @return [String, nil]
        optional :created_at, String, api_name: :createdAt

        # @!attribute lifecycle_state
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :lifecycle_state,
                 XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown],
                 api_name: :lifecycleState

        # @!attribute like_count
        #
        #   @return [Integer, nil]
        optional :like_count, Integer, api_name: :likeCount

        # @!attribute metadata
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :metadata, XTwitterScraper::Internal::Type::HashOf[XTwitterScraper::Internal::Type::Unknown]

        # @!attribute preview_text
        #
        #   @return [String, nil]
        optional :preview_text, String, api_name: :previewText

        # @!attribute quote_count
        #
        #   @return [Integer, nil]
        optional :quote_count, Integer, api_name: :quoteCount

        # @!attribute reply_count
        #
        #   @return [Integer, nil]
        optional :reply_count, Integer, api_name: :replyCount

        # @!attribute retweet_count
        #   Reposts of the Article's post. 0 or more.
        #
        #   @return [Integer, nil]
        optional :retweet_count, Integer, api_name: :retweetCount

        # @!attribute summary_text
        #   X's summary of the Article, when X has one
        #
        #   @return [String, nil]
        optional :summary_text, String, api_name: :summaryText

        # @!attribute title
        #
        #   @return [String, nil]
        optional :title, String

        # @!attribute unknown_counts
        #
        #   @return [Array<Symbol, XTwitterScraper::Models::XGetArticleResponse::Article::UnknownCount>, nil]
        optional :unknown_counts,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::Models::XGetArticleResponse::Article::UnknownCount] },
                 api_name: :unknownCounts

        # @!attribute view_count
        #
        #   @return [Integer, nil]
        optional :view_count, Integer, api_name: :viewCount

        # @!method initialize(article_id: nil, body_markdown: nil, body_text: nil, bookmark_count: nil, contents: nil, cover_image_url: nil, cover_media: nil, created_at: nil, lifecycle_state: nil, like_count: nil, metadata: nil, preview_text: nil, quote_count: nil, reply_count: nil, retweet_count: nil, summary_text: nil, title: nil, unknown_counts: nil, view_count: nil)
        #   @param article_id [String] X's ID for the Article, which differs from its post's ID
        #
        #   @param body_markdown [String] Article blocks as Markdown, with headings, lists, bold, italic, links, images &
        #
        #   @param body_text [String] Plain text joined from all article blocks
        #
        #   @param bookmark_count [Integer] Accounts that bookmarked the Article's post. 0 or more.
        #
        #   @param contents [Array<XTwitterScraper::Models::XGetArticleResponse::Article::Content>]
        #
        #   @param cover_image_url [String]
        #
        #   @param cover_media [Hash{Symbol=>Object}]
        #
        #   @param created_at [String]
        #
        #   @param lifecycle_state [Hash{Symbol=>Object}]
        #
        #   @param like_count [Integer]
        #
        #   @param metadata [Hash{Symbol=>Object}]
        #
        #   @param preview_text [String]
        #
        #   @param quote_count [Integer]
        #
        #   @param reply_count [Integer]
        #
        #   @param retweet_count [Integer] Reposts of the Article's post. 0 or more.
        #
        #   @param summary_text [String] X's summary of the Article, when X has one
        #
        #   @param title [String]
        #
        #   @param unknown_counts [Array<Symbol, XTwitterScraper::Models::XGetArticleResponse::Article::UnknownCount>]
        #
        #   @param view_count [Integer]

        class Content < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute alt_text
          #   Alt text of the image or preview image
          #
          #   @return [String, nil]
          optional :alt_text, String, api_name: :altText

          # @!attribute caption
          #   Caption the author wrote under a media block
          #
          #   @return [String, nil]
          optional :caption, String

          # @!attribute duration_ms
          #   Length of a video, in milliseconds
          #
          #   @return [Integer, nil]
          optional :duration_ms, Integer, api_name: :durationMs

          # @!attribute height
          #
          #   @return [Integer, nil]
          optional :height, Integer

          # @!attribute inline_style_ranges
          #   Inline text formatting ranges
          #
          #   @return [Array<XTwitterScraper::Models::XGetArticleResponse::Article::Content::InlineStyleRange>, nil]
          optional :inline_style_ranges,
                   -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::XGetArticleResponse::Article::Content::InlineStyleRange] },
                   api_name: :inlineStyleRanges

          # @!attribute links
          #   Links in the block's text, with the text range each covers
          #
          #   @return [Array<XTwitterScraper::Models::XGetArticleResponse::Article::Content::Link>, nil]
          optional :links,
                   -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::XGetArticleResponse::Article::Content::Link] }

          # @!attribute media_type
          #   What a media block holds
          #
          #   @return [Symbol, XTwitterScraper::Models::XGetArticleResponse::Article::Content::MediaType, nil]
          optional :media_type,
                   enum: -> { XTwitterScraper::Models::XGetArticleResponse::Article::Content::MediaType },
                   api_name: :mediaType

          # @!attribute preview_url
          #   Preview image URL for media blocks
          #
          #   @return [String, nil]
          optional :preview_url, String, api_name: :previewUrl

          # @!attribute text
          #
          #   @return [String, nil]
          optional :text, String

          # @!attribute tweet_id
          #   ID of the post a tweet block embeds
          #
          #   @return [String, nil]
          optional :tweet_id, String, api_name: :tweetId

          # @!attribute type
          #   Block type: paragraph, header-one, header-two, header-three, header-four,
          #   header-five, header-six, unordered-list-item, ordered-list-item, blockquote,
          #   code-block, media, divider
          #
          #   @return [String, nil]
          optional :type, String

          # @!attribute url
          #   Media URL for media blocks
          #
          #   @return [String, nil]
          optional :url, String

          # @!attribute variants
          #   Files of a video or GIF block, in X's order
          #
          #   @return [Array<XTwitterScraper::Models::XGetArticleResponse::Article::Content::Variant>, nil]
          optional :variants,
                   -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::XGetArticleResponse::Article::Content::Variant] }

          # @!attribute width
          #
          #   @return [Integer, nil]
          optional :width, Integer

          # @!method initialize(alt_text: nil, caption: nil, duration_ms: nil, height: nil, inline_style_ranges: nil, links: nil, media_type: nil, preview_url: nil, text: nil, tweet_id: nil, type: nil, url: nil, variants: nil, width: nil)
          #   @param alt_text [String] Alt text of the image or preview image
          #
          #   @param caption [String] Caption the author wrote under a media block
          #
          #   @param duration_ms [Integer] Length of a video, in milliseconds
          #
          #   @param height [Integer]
          #
          #   @param inline_style_ranges [Array<XTwitterScraper::Models::XGetArticleResponse::Article::Content::InlineStyleRange>] Inline text formatting ranges
          #
          #   @param links [Array<XTwitterScraper::Models::XGetArticleResponse::Article::Content::Link>] Links in the block's text, with the text range each covers
          #
          #   @param media_type [Symbol, XTwitterScraper::Models::XGetArticleResponse::Article::Content::MediaType] What a media block holds
          #
          #   @param preview_url [String] Preview image URL for media blocks
          #
          #   @param text [String]
          #
          #   @param tweet_id [String] ID of the post a tweet block embeds
          #
          #   @param type [String] Block type: paragraph, header-one, header-two, header-three, header-four, header
          #
          #   @param url [String] Media URL for media blocks
          #
          #   @param variants [Array<XTwitterScraper::Models::XGetArticleResponse::Article::Content::Variant>] Files of a video or GIF block, in X's order
          #
          #   @param width [Integer]

          class InlineStyleRange < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute length
            #
            #   @return [Integer, nil]
            optional :length, Integer

            # @!attribute offset
            #
            #   @return [Integer, nil]
            optional :offset, Integer

            # @!attribute style
            #
            #   @return [String, nil]
            optional :style, String

            # @!method initialize(length: nil, offset: nil, style: nil)
            #   @param length [Integer]
            #   @param offset [Integer]
            #   @param style [String]
          end

          # @see XTwitterScraper::Models::XGetArticleResponse::Article::Content#links
          class Link < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute offset
            #
            #   @return [Integer, nil]
            optional :offset, Integer

            # @!attribute length
            #
            #   @return [Integer, nil]
            optional :length, Integer

            # @!attribute url
            #
            #   @return [String, nil]
            optional :url, String

            # @!method initialize(offset: nil, length: nil, url: nil)
            #   @param offset [Integer]
            #   @param length [Integer]
            #   @param url [String]
          end

          # What a media block holds
          #
          # @see XTwitterScraper::Models::XGetArticleResponse::Article::Content#media_type
          module MediaType
            extend XTwitterScraper::Internal::Type::Enum

            IMAGE = :image
            VIDEO = :video
            GIF = :gif

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see XTwitterScraper::Models::XGetArticleResponse::Article::Content#variants
          class Variant < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute content_type
            #
            #   @return [String]
            required :content_type, String, api_name: :contentType

            # @!attribute url
            #
            #   @return [String]
            required :url, String

            # @!attribute bitrate
            #
            #   @return [Integer, nil]
            optional :bitrate, Integer

            # @!method initialize(content_type:, url:, bitrate: nil)
            #   @param content_type [String]
            #   @param url [String]
            #   @param bitrate [Integer]
          end
        end

        # @see XTwitterScraper::Models::XGetArticleResponse::Article#unknown_counts
        module UnknownCount
          extend XTwitterScraper::Internal::Type::Enum

          RETWEET_COUNT = :retweetCount
          REPLY_COUNT = :replyCount
          LIKE_COUNT = :likeCount
          QUOTE_COUNT = :quoteCount
          VIEW_COUNT = :viewCount
          BOOKMARK_COUNT = :bookmarkCount

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see XTwitterScraper::Models::XGetArticleResponse#author
      class Author < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute username
        #
        #   @return [String]
        required :username, String

        # @!attribute created_at
        #
        #   @return [String, nil]
        optional :created_at, String, api_name: :createdAt

        # @!attribute description
        #
        #   @return [String, nil]
        optional :description, String

        # @!attribute favourites_count
        #
        #   @return [Integer, nil]
        optional :favourites_count, Integer, api_name: :favouritesCount

        # @!attribute followers_count
        #
        #   @return [Integer, nil]
        optional :followers_count, Integer, api_name: :followersCount

        # @!attribute following_count
        #
        #   @return [Integer, nil]
        optional :following_count, Integer, api_name: :followingCount

        # @!attribute is_blue_verified
        #
        #   @return [Boolean, nil]
        optional :is_blue_verified, XTwitterScraper::Internal::Type::Boolean, api_name: :isBlueVerified

        # @!attribute is_translator
        #
        #   @return [Boolean, nil]
        optional :is_translator, XTwitterScraper::Internal::Type::Boolean, api_name: :isTranslator

        # @!attribute is_verified
        #
        #   @return [Boolean, nil]
        optional :is_verified, XTwitterScraper::Internal::Type::Boolean, api_name: :isVerified

        # @!attribute location
        #
        #   @return [String, nil]
        optional :location, String

        # @!attribute media_count
        #
        #   @return [Integer, nil]
        optional :media_count, Integer, api_name: :mediaCount

        # @!attribute profile_banner_url
        #
        #   @return [String, nil]
        optional :profile_banner_url, String, api_name: :profileBannerUrl

        # @!attribute profile_picture
        #
        #   @return [String, nil]
        optional :profile_picture, String, api_name: :profilePicture

        # @!attribute profile_picture_original
        #   The same profile picture at full size.
        #
        #   @return [String, nil]
        optional :profile_picture_original, String, api_name: :profilePictureOriginal

        # @!attribute protected
        #
        #   @return [Boolean, nil]
        optional :protected, XTwitterScraper::Internal::Type::Boolean

        # @!attribute statuses_count
        #
        #   @return [Integer, nil]
        optional :statuses_count, Integer, api_name: :statusesCount

        # @!attribute url
        #
        #   @return [String, nil]
        optional :url, String

        # @!method initialize(id:, name:, username:, created_at: nil, description: nil, favourites_count: nil, followers_count: nil, following_count: nil, is_blue_verified: nil, is_translator: nil, is_verified: nil, location: nil, media_count: nil, profile_banner_url: nil, profile_picture: nil, profile_picture_original: nil, protected: nil, statuses_count: nil, url: nil)
        #   X Article author profile fields returned when available.
        #
        #   @param id [String]
        #   @param name [String]
        #   @param username [String]
        #   @param created_at [String]
        #   @param description [String]
        #   @param favourites_count [Integer]
        #   @param followers_count [Integer]
        #   @param following_count [Integer]
        #   @param is_blue_verified [Boolean]
        #   @param is_translator [Boolean]
        #   @param is_verified [Boolean]
        #   @param location [String]
        #   @param media_count [Integer]
        #   @param profile_banner_url [String]
        #   @param profile_picture [String]
        #   @param profile_picture_original [String] The same profile picture at full size.
        #   @param protected [Boolean]
        #   @param statuses_count [Integer]
        #   @param url [String]
      end
    end
  end
end
