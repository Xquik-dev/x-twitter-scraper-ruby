# typed: strong

module XTwitterScraper
  module Models
    module X
      class MediaDownloadParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::MediaDownloadParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Array of tweet URLs or IDs (bulk, max 50)
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :tweet_ids

        sig { params(tweet_ids: T::Array[String]).void }
        attr_writer :tweet_ids

        # Tweet URL or ID (single tweet)
        sig { returns(T.nilable(String)) }
        attr_reader :tweet_input

        sig { params(tweet_input: String).void }
        attr_writer :tweet_input

        sig do
          params(
            tweet_ids: T::Array[String],
            tweet_input: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Array of tweet URLs or IDs (bulk, max 50)
          tweet_ids: nil,
          # Tweet URL or ID (single tweet)
          tweet_input: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              tweet_ids: T::Array[String],
              tweet_input: String,
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
