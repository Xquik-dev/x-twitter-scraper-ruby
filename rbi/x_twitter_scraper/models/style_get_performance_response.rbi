# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class StyleGetPerformanceResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::StyleGetPerformanceResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(Integer) }
      attr_accessor :tweet_count

      sig do
        returns(
          T::Array[XTwitterScraper::Models::StyleGetPerformanceResponse::Tweet]
        )
      end
      attr_accessor :tweets

      sig { returns(String) }
      attr_accessor :x_username

      sig do
        params(
          tweet_count: Integer,
          tweets:
            T::Array[
              XTwitterScraper::Models::StyleGetPerformanceResponse::Tweet::OrHash
            ],
          x_username: String
        ).returns(T.attached_class)
      end
      def self.new(tweet_count:, tweets:, x_username:)
      end

      sig do
        override.returns(
          {
            tweet_count: Integer,
            tweets:
              T::Array[
                XTwitterScraper::Models::StyleGetPerformanceResponse::Tweet
              ],
            x_username: String
          }
        )
      end
      def to_hash
      end

      class Tweet < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::StyleGetPerformanceResponse::Tweet,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :text

        sig { returns(T.nilable(String)) }
        attr_reader :created_at

        sig { params(created_at: String).void }
        attr_writer :created_at

        sig { returns(T.nilable(Integer)) }
        attr_reader :like_count

        sig { params(like_count: Integer).void }
        attr_writer :like_count

        sig { returns(T.nilable(Integer)) }
        attr_reader :reply_count

        sig { params(reply_count: Integer).void }
        attr_writer :reply_count

        sig { returns(T.nilable(Integer)) }
        attr_reader :retweet_count

        sig { params(retweet_count: Integer).void }
        attr_writer :retweet_count

        sig { returns(T.nilable(Integer)) }
        attr_reader :view_count

        sig { params(view_count: Integer).void }
        attr_writer :view_count

        sig do
          params(
            id: String,
            text: String,
            created_at: String,
            like_count: Integer,
            reply_count: Integer,
            retweet_count: Integer,
            view_count: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          text:,
          created_at: nil,
          like_count: nil,
          reply_count: nil,
          retweet_count: nil,
          view_count: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              text: String,
              created_at: String,
              like_count: Integer,
              reply_count: Integer,
              retweet_count: Integer,
              view_count: Integer
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
