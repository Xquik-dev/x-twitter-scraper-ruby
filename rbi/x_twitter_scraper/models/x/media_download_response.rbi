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

        sig { returns(T.nilable(XTwitterScraper::ImageFilterSummary)) }
        attr_reader :image_filter

        sig do
          params(image_filter: XTwitterScraper::ImageFilterSummary::OrHash).void
        end
        attr_writer :image_filter

        # The post's files saved to your gallery. Single downloads only. Empty when
        # imageShows kept no photo.
        sig do
          returns(
            T.nilable(T::Array[XTwitterScraper::X::MediaDownloadResponse::Item])
          )
        end
        attr_reader :items

        sig do
          params(
            items:
              T::Array[XTwitterScraper::X::MediaDownloadResponse::Item::OrHash]
          ).void
        end
        attr_writer :items

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

        # Posts Xquik had no time to read, at no charge. Send them again.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :unprocessed_tweet_ids

        sig { params(unprocessed_tweet_ids: T::Array[String]).void }
        attr_writer :unprocessed_tweet_ids

        sig do
          params(
            cache_hit: T::Boolean,
            gallery_url: String,
            image_filter: XTwitterScraper::ImageFilterSummary::OrHash,
            items:
              T::Array[XTwitterScraper::X::MediaDownloadResponse::Item::OrHash],
            total_media: Integer,
            total_tweets: Integer,
            tweet_id: String,
            unprocessed_tweet_ids: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(
          cache_hit: nil,
          gallery_url: nil,
          image_filter: nil,
          # The post's files saved to your gallery. Single downloads only. Empty when
          # imageShows kept no photo.
          items: nil,
          total_media: nil,
          total_tweets: nil,
          tweet_id: nil,
          # Posts Xquik had no time to read, at no charge. Send them again.
          unprocessed_tweet_ids: nil
        )
        end

        sig do
          override.returns(
            {
              cache_hit: T::Boolean,
              gallery_url: String,
              image_filter: XTwitterScraper::ImageFilterSummary,
              items: T::Array[XTwitterScraper::X::MediaDownloadResponse::Item],
              total_media: Integer,
              total_tweets: Integer,
              tweet_id: String,
              unprocessed_tweet_ids: T::Array[String]
            }
          )
        end
        def to_hash
        end

        class Item < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::X::MediaDownloadResponse::Item,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Gallery file ID
          sig { returns(String) }
          attr_accessor :id

          sig { returns(String) }
          attr_accessor :tweet_id

          sig do
            returns(
              XTwitterScraper::X::MediaDownloadResponse::Item::MediaType::TaggedSymbol
            )
          end
          attr_accessor :media_type

          # Link to the file. It goes to X when X flagged the post or its media at save
          # time, or sent no post flag. Xquik keeps no copy of those files.
          sig { returns(String) }
          attr_accessor :media_url

          # Cover image of a video or GIF. Null for photos & files first saved to Xquik
          # before 2026-11-03.
          sig { returns(T.nilable(String)) }
          attr_accessor :poster_url

          # The MP4 sizes X stores for a video, highest bitrate first. Empty for photos,
          # GIFs & files first saved to Xquik before 2026-11-03.
          sig do
            returns(
              T::Array[XTwitterScraper::X::MediaDownloadResponse::Item::Quality]
            )
          end
          attr_accessor :qualities

          # File size in bytes, as a string
          sig { returns(T.nilable(String)) }
          attr_accessor :file_size

          # When the file joined your gallery
          sig { returns(Time) }
          attr_accessor :created_at

          sig { returns(String) }
          attr_accessor :author_username

          sig { returns(String) }
          attr_accessor :author_display_name

          sig { returns(T.nilable(String)) }
          attr_accessor :author_avatar

          sig { returns(String) }
          attr_accessor :tweet_text

          sig { returns(T.nilable(Integer)) }
          attr_accessor :likes

          sig { returns(T.nilable(Integer)) }
          attr_accessor :retweets

          sig { returns(T.nilable(Integer)) }
          attr_accessor :views

          sig do
            params(
              id: String,
              tweet_id: String,
              media_type:
                XTwitterScraper::X::MediaDownloadResponse::Item::MediaType::OrSymbol,
              media_url: String,
              poster_url: T.nilable(String),
              qualities:
                T::Array[
                  XTwitterScraper::X::MediaDownloadResponse::Item::Quality::OrHash
                ],
              file_size: T.nilable(String),
              created_at: Time,
              author_username: String,
              author_display_name: String,
              author_avatar: T.nilable(String),
              tweet_text: String,
              likes: T.nilable(Integer),
              retweets: T.nilable(Integer),
              views: T.nilable(Integer)
            ).returns(T.attached_class)
          end
          def self.new(
            # Gallery file ID
            id:,
            tweet_id:,
            media_type:,
            # Link to the file. It goes to X when X flagged the post or its media at save
            # time, or sent no post flag. Xquik keeps no copy of those files.
            media_url:,
            # Cover image of a video or GIF. Null for photos & files first saved to Xquik
            # before 2026-11-03.
            poster_url:,
            # The MP4 sizes X stores for a video, highest bitrate first. Empty for photos,
            # GIFs & files first saved to Xquik before 2026-11-03.
            qualities:,
            # File size in bytes, as a string
            file_size:,
            # When the file joined your gallery
            created_at:,
            author_username:,
            author_display_name:,
            author_avatar:,
            tweet_text:,
            likes:,
            retweets:,
            views:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                tweet_id: String,
                media_type:
                  XTwitterScraper::X::MediaDownloadResponse::Item::MediaType::TaggedSymbol,
                media_url: String,
                poster_url: T.nilable(String),
                qualities:
                  T::Array[
                    XTwitterScraper::X::MediaDownloadResponse::Item::Quality
                  ],
                file_size: T.nilable(String),
                created_at: Time,
                author_username: String,
                author_display_name: String,
                author_avatar: T.nilable(String),
                tweet_text: String,
                likes: T.nilable(Integer),
                retweets: T.nilable(Integer),
                views: T.nilable(Integer)
              }
            )
          end
          def to_hash
          end

          module MediaType
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::X::MediaDownloadResponse::Item::MediaType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            PHOTO =
              T.let(
                :photo,
                XTwitterScraper::X::MediaDownloadResponse::Item::MediaType::TaggedSymbol
              )
            VIDEO =
              T.let(
                :video,
                XTwitterScraper::X::MediaDownloadResponse::Item::MediaType::TaggedSymbol
              )
            ANIMATED_GIF =
              T.let(
                :animated_gif,
                XTwitterScraper::X::MediaDownloadResponse::Item::MediaType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::X::MediaDownloadResponse::Item::MediaType::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Quality < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::X::MediaDownloadResponse::Item::Quality,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig { returns(Integer) }
            attr_accessor :bitrate

            sig { returns(Integer) }
            attr_accessor :height

            sig { returns(String) }
            attr_accessor :url

            sig { returns(Integer) }
            attr_accessor :width

            sig do
              params(
                bitrate: Integer,
                height: Integer,
                url: String,
                width: Integer
              ).returns(T.attached_class)
            end
            def self.new(bitrate:, height:, url:, width:)
            end

            sig do
              override.returns(
                {
                  bitrate: Integer,
                  height: Integer,
                  url: String,
                  width: Integer
                }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
