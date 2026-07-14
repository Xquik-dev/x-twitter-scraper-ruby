# typed: strong

module XTwitterScraper
  module Models
    class TweetMedia < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(XTwitterScraper::TweetMedia, XTwitterScraper::Internal::AnyHash)
        end

      # Media preview URL
      sig { returns(String) }
      attr_accessor :media_url

      sig { returns(XTwitterScraper::TweetMedia::Type::TaggedSymbol) }
      attr_accessor :type

      # X media link from the tweet
      sig { returns(String) }
      attr_accessor :url

      # Available video encodings, ordered as returned
      sig do
        returns(T.nilable(T::Array[XTwitterScraper::TweetMedia::VideoVariant]))
      end
      attr_reader :video_variants

      sig do
        params(
          video_variants:
            T::Array[XTwitterScraper::TweetMedia::VideoVariant::OrHash]
        ).void
      end
      attr_writer :video_variants

      # Normalized media attached to a tweet.
      sig do
        params(
          media_url: String,
          type: XTwitterScraper::TweetMedia::Type::OrSymbol,
          url: String,
          video_variants:
            T::Array[XTwitterScraper::TweetMedia::VideoVariant::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # Media preview URL
        media_url:,
        type:,
        # X media link from the tweet
        url:,
        # Available video encodings, ordered as returned
        video_variants: nil
      )
      end

      sig do
        override.returns(
          {
            media_url: String,
            type: XTwitterScraper::TweetMedia::Type::TaggedSymbol,
            url: String,
            video_variants: T::Array[XTwitterScraper::TweetMedia::VideoVariant]
          }
        )
      end
      def to_hash
      end

      module Type
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, XTwitterScraper::TweetMedia::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PHOTO = T.let(:photo, XTwitterScraper::TweetMedia::Type::TaggedSymbol)
        VIDEO = T.let(:video, XTwitterScraper::TweetMedia::Type::TaggedSymbol)
        ANIMATED_GIF =
          T.let(:animated_gif, XTwitterScraper::TweetMedia::Type::TaggedSymbol)

        sig do
          override.returns(
            T::Array[XTwitterScraper::TweetMedia::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class VideoVariant < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::TweetMedia::VideoVariant,
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
          params(content_type: String, url: String, bitrate: Integer).returns(
            T.attached_class
          )
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
  end
end
