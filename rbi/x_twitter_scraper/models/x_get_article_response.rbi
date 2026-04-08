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

      # Author of a tweet with follower count and verification status.
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
        # Author of a tweet with follower count and verification status.
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

          sig { returns(T.nilable(String)) }
          attr_reader :text

          sig { params(text: String).void }
          attr_writer :text

          # Block type: unstyled, header-one, header-two, header-three, unordered-list-item,
          # ordered-list-item, image, gif, divider
          sig { returns(T.nilable(String)) }
          attr_reader :type

          sig { params(type: String).void }
          attr_writer :type

          # Media URL for image/gif blocks
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
              text: String,
              type: String,
              url: String,
              width: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            height: nil,
            text: nil,
            # Block type: unstyled, header-one, header-two, header-three, unordered-list-item,
            # ordered-list-item, image, gif, divider
            type: nil,
            # Media URL for image/gif blocks
            url: nil,
            width: nil
          )
          end

          sig do
            override.returns(
              {
                height: Integer,
                text: String,
                type: String,
                url: String,
                width: Integer
              }
            )
          end
          def to_hash
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

        sig { returns(Integer) }
        attr_accessor :followers

        sig { returns(String) }
        attr_accessor :username

        sig { returns(T::Boolean) }
        attr_accessor :verified

        sig { returns(T.nilable(String)) }
        attr_reader :profile_picture

        sig { params(profile_picture: String).void }
        attr_writer :profile_picture

        # Author of a tweet with follower count and verification status.
        sig do
          params(
            id: String,
            followers: Integer,
            username: String,
            verified: T::Boolean,
            profile_picture: String
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          followers:,
          username:,
          verified:,
          profile_picture: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              followers: Integer,
              username: String,
              verified: T::Boolean,
              profile_picture: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
