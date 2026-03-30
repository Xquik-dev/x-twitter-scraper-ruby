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
      #
      #   @return [XTwitterScraper::Models::X::TweetAuthor, nil]
      optional :author, -> { XTwitterScraper::X::TweetAuthor }

      # @!method initialize(article:, author: nil)
      #   @param article [XTwitterScraper::Models::XGetArticleResponse::Article]
      #   @param author [XTwitterScraper::Models::X::TweetAuthor]

      # @see XTwitterScraper::Models::XGetArticleResponse#article
      class Article < XTwitterScraper::Internal::Type::BaseModel
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

        # @!method initialize(contents: nil, cover_image_url: nil, created_at: nil, like_count: nil, preview_text: nil, quote_count: nil, reply_count: nil, title: nil, view_count: nil)
        #   @param contents [Array<XTwitterScraper::Models::XGetArticleResponse::Article::Content>]
        #   @param cover_image_url [String]
        #   @param created_at [String]
        #   @param like_count [Integer]
        #   @param preview_text [String]
        #   @param quote_count [Integer]
        #   @param reply_count [Integer]
        #   @param title [String]
        #   @param view_count [Integer]

        class Content < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute height
          #
          #   @return [Integer, nil]
          optional :height, Integer

          # @!attribute text
          #
          #   @return [String, nil]
          optional :text, String

          # @!attribute type
          #   Block type: unstyled, header-one, header-two, header-three, unordered-list-item,
          #   ordered-list-item, image, gif, divider
          #
          #   @return [String, nil]
          optional :type, String

          # @!attribute url
          #   Media URL for image/gif blocks
          #
          #   @return [String, nil]
          optional :url, String

          # @!attribute width
          #
          #   @return [Integer, nil]
          optional :width, Integer

          # @!method initialize(height: nil, text: nil, type: nil, url: nil, width: nil)
          #   Some parameter documentations has been truncated, see
          #   {XTwitterScraper::Models::XGetArticleResponse::Article::Content} for more
          #   details.
          #
          #   @param height [Integer]
          #
          #   @param text [String]
          #
          #   @param type [String] Block type: unstyled, header-one, header-two, header-three, unordered-list-item,
          #
          #   @param url [String] Media URL for image/gif blocks
          #
          #   @param width [Integer]
        end
      end
    end
  end
end
