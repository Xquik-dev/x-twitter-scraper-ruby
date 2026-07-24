# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

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

        # Numeric tweet ID alias for tweetInput
        sig { returns(T.nilable(String)) }
        attr_reader :tweet_id

        sig { params(tweet_id: String).void }
        attr_writer :tweet_id

        # Array of tweet URLs or IDs (bulk, max 50 string items)
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :tweet_ids

        sig { params(tweet_ids: T::Array[String]).void }
        attr_writer :tweet_ids

        # Tweet URL or ID (single tweet)
        sig { returns(T.nilable(String)) }
        attr_reader :tweet_input

        sig { params(tweet_input: String).void }
        attr_writer :tweet_input

        # Tweet URL alias for tweetInput
        sig { returns(T.nilable(String)) }
        attr_reader :tweet_url

        sig { params(tweet_url: String).void }
        attr_writer :tweet_url

        sig do
          params(
            tweet_id: String,
            tweet_ids: T::Array[String],
            tweet_input: String,
            tweet_url: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Numeric tweet ID alias for tweetInput
          tweet_id: nil,
          # Array of tweet URLs or IDs (bulk, max 50 string items)
          tweet_ids: nil,
          # Tweet URL or ID (single tweet)
          tweet_input: nil,
          # Tweet URL alias for tweetInput
          tweet_url: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              tweet_id: String,
              tweet_ids: T::Array[String],
              tweet_input: String,
              tweet_url: String,
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
