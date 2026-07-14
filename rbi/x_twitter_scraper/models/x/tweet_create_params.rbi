# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetCreateParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::TweetCreateParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # X account (@username or account ID)
        sig { returns(String) }
        attr_accessor :account

        sig { returns(T.nilable(String)) }
        attr_reader :attachment_url

        sig { params(attachment_url: String).void }
        attr_writer :attachment_url

        sig { returns(T.nilable(String)) }
        attr_reader :community_id

        sig { params(community_id: String).void }
        attr_writer :community_id

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_note_tweet

        sig { params(is_note_tweet: T::Boolean).void }
        attr_writer :is_note_tweet

        # Array of public media URLs to attach. Supports up to 4 images or exactly 1 MP4
        # video up to 100 MB. Each URL must be publicly reachable. Attached media adds 2
        # credits per started MB across all files.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :media

        sig { params(media: T::Array[String]).void }
        attr_writer :media

        sig { returns(T.nilable(String)) }
        attr_reader :reply_to_tweet_id

        sig { params(reply_to_tweet_id: String).void }
        attr_writer :reply_to_tweet_id

        # Tweet text (optional when media is provided)
        sig { returns(T.nilable(String)) }
        attr_reader :text

        sig { params(text: String).void }
        attr_writer :text

        sig do
          params(
            account: String,
            attachment_url: String,
            community_id: String,
            is_note_tweet: T::Boolean,
            media: T::Array[String],
            reply_to_tweet_id: String,
            text: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # X account (@username or account ID)
          account:,
          attachment_url: nil,
          community_id: nil,
          is_note_tweet: nil,
          # Array of public media URLs to attach. Supports up to 4 images or exactly 1 MP4
          # video up to 100 MB. Each URL must be publicly reachable. Attached media adds 2
          # credits per started MB across all files.
          media: nil,
          reply_to_tweet_id: nil,
          # Tweet text (optional when media is provided)
          text: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              account: String,
              attachment_url: String,
              community_id: String,
              is_note_tweet: T::Boolean,
              media: T::Array[String],
              reply_to_tweet_id: String,
              text: String,
              request_options: XTwitterScraper::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
