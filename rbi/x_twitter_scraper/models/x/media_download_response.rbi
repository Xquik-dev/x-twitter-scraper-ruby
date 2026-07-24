# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class MediaDownloadResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::MediaDownloadResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :cache_hit

        sig { params(cache_hit: T::Boolean).void }
        attr_writer :cache_hit

        sig { returns(T.nilable(String)) }
        attr_reader :gallery_url

        sig { params(gallery_url: String).void }
        attr_writer :gallery_url

        sig { returns(T.nilable(Integer)) }
        attr_reader :total_media

        sig { params(total_media: Integer).void }
        attr_writer :total_media

        sig { returns(T.nilable(Integer)) }
        attr_reader :total_tweets

        sig { params(total_tweets: Integer).void }
        attr_writer :total_tweets

        sig { returns(T.nilable(String)) }
        attr_reader :tweet_id

        sig { params(tweet_id: String).void }
        attr_writer :tweet_id

        sig do
          params(
            cache_hit: T::Boolean,
            gallery_url: String,
            total_media: Integer,
            total_tweets: Integer,
            tweet_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          cache_hit: nil,
          gallery_url: nil,
          total_media: nil,
          total_tweets: nil,
          tweet_id: nil
        )
        end

        sig do
          override.returns(
            {
              cache_hit: T::Boolean,
              gallery_url: String,
              total_media: Integer,
              total_tweets: Integer,
              tweet_id: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
