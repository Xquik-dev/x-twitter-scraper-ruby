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

        sig { returns(String) }
        attr_accessor :text

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

        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :media_ids

        sig { params(media_ids: T::Array[String]).void }
        attr_writer :media_ids

        sig { returns(T.nilable(String)) }
        attr_reader :reply_to_tweet_id

        sig { params(reply_to_tweet_id: String).void }
        attr_writer :reply_to_tweet_id

        sig do
          params(
            account: String,
            text: String,
            attachment_url: String,
            community_id: String,
            is_note_tweet: T::Boolean,
            media_ids: T::Array[String],
            reply_to_tweet_id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # X account (@username or account ID)
          account:,
          text:,
          attachment_url: nil,
          community_id: nil,
          is_note_tweet: nil,
          media_ids: nil,
          reply_to_tweet_id: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              account: String,
              text: String,
              attachment_url: String,
              community_id: String,
              is_note_tweet: T::Boolean,
              media_ids: T::Array[String],
              reply_to_tweet_id: String,
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
