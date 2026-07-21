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
        # @!attribute body_text
        #   Plain text joined from all article blocks
        #
        #   @return [String, nil]
        optional :body_text, String, api_name: :bodyText

        # @!attribute contents
        #
        #   @return [Array<XTwitterScraper::Models::XGetArticleResponse::Article::Content>, nil]
        optional :contents,
                 -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::XGetArticleResponse::Article::Content] }

        # @!attribute cover_image_url
        #
        #   @return [String, nil]
        optional :cover_image_url, String, api_name: :coverImageUrl

        # @!attribute created_at
        #
        #   @return [String, nil]
        optional :created_at, String, api_name: :createdAt

        # @!attribute like_count
        #
        #   @return [Integer, nil]
        optional :like_count, Integer, api_name: :likeCount

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

        # @!attribute title
        #
        #   @return [String, nil]
        optional :title, String

        # @!attribute view_count
        #
        #   @return [Integer, nil]
        optional :view_count, Integer, api_name: :viewCount

        # @!method initialize(body_text: nil, contents: nil, cover_image_url: nil, created_at: nil, like_count: nil, preview_text: nil, quote_count: nil, reply_count: nil, title: nil, view_count: nil)
        #   @param body_text [String] Plain text joined from all article blocks
        #
        #   @param contents [Array<XTwitterScraper::Models::XGetArticleResponse::Article::Content>]
        #
        #   @param cover_image_url [String]
        #
        #   @param created_at [String]
        #
        #   @param like_count [Integer]
        #
        #   @param preview_text [String]
        #
        #   @param quote_count [Integer]
        #
        #   @param reply_count [Integer]
        #
        #   @param title [String]
        #
        #   @param view_count [Integer]

        class Content < XTwitterScraper::Internal::Type::BaseModel
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

          # @!attribute preview_url
          #   Preview image URL for media blocks
          #
          #   @return [String, nil]
          optional :preview_url, String, api_name: :previewUrl

          # @!attribute text
          #
          #   @return [String, nil]
          optional :text, String

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

          # @!attribute width
          #
          #   @return [Integer, nil]
          optional :width, Integer

          # @!method initialize(height: nil, inline_style_ranges: nil, preview_url: nil, text: nil, type: nil, url: nil, width: nil)
          #   Some parameter documentations has been truncated, see
          #   {XTwitterScraper::Models::XGetArticleResponse::Article::Content} for more
          #   details.
          #
          #   @param height [Integer]
          #
          #   @param inline_style_ranges [Array<XTwitterScraper::Models::XGetArticleResponse::Article::Content::InlineStyleRange>] Inline text formatting ranges
          #
          #   @param preview_url [String] Preview image URL for media blocks
          #
          #   @param text [String]
          #
          #   @param type [String] Block type: paragraph, header-one, header-two, header-three, header-four, header
          #
          #   @param url [String] Media URL for media blocks
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

        # @!attribute can_dm
        #
        #   @return [Boolean, nil]
        optional :can_dm, XTwitterScraper::Internal::Type::Boolean, api_name: :canDm

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

        # @!method initialize(id:, name:, username:, can_dm: nil, created_at: nil, description: nil, favourites_count: nil, followers_count: nil, following_count: nil, is_blue_verified: nil, is_translator: nil, is_verified: nil, location: nil, media_count: nil, profile_banner_url: nil, profile_picture: nil, protected: nil, statuses_count: nil, url: nil)
        #   X Article author profile fields returned when available.
        #
        #   @param id [String]
        #   @param name [String]
        #   @param username [String]
        #   @param can_dm [Boolean]
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
        #   @param protected [Boolean]
        #   @param statuses_count [Integer]
        #   @param url [String]
      end
    end
  end
end
