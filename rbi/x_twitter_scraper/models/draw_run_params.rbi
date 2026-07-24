# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class DrawRunParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::DrawRunParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :tweet_url

      sig { returns(T.nilable(Integer)) }
      attr_reader :backup_count

      sig { params(backup_count: Integer).void }
      attr_writer :backup_count

      sig { returns(T.nilable(Integer)) }
      attr_reader :filter_account_age_days

      sig { params(filter_account_age_days: Integer).void }
      attr_writer :filter_account_age_days

      sig { returns(T.nilable(String)) }
      attr_reader :filter_language

      sig { params(filter_language: String).void }
      attr_writer :filter_language

      sig { returns(T.nilable(Integer)) }
      attr_reader :filter_min_followers

      sig { params(filter_min_followers: Integer).void }
      attr_writer :filter_min_followers

      sig { returns(T.nilable(String)) }
      attr_reader :must_follow_username

      sig { params(must_follow_username: String).void }
      attr_writer :must_follow_username

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :must_retweet

      sig { params(must_retweet: T::Boolean).void }
      attr_writer :must_retweet

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :required_hashtags

      sig { params(required_hashtags: T::Array[String]).void }
      attr_writer :required_hashtags

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :required_keywords

      sig { params(required_keywords: T::Array[String]).void }
      attr_writer :required_keywords

      sig { returns(T.nilable(T::Array[String])) }
      attr_reader :required_mentions

      sig { params(required_mentions: T::Array[String]).void }
      attr_writer :required_mentions

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :unique_authors_only

      sig { params(unique_authors_only: T::Boolean).void }
      attr_writer :unique_authors_only

      sig { returns(T.nilable(Integer)) }
      attr_reader :winner_count

      sig { params(winner_count: Integer).void }
      attr_writer :winner_count

      sig do
        params(
          tweet_url: String,
          backup_count: Integer,
          filter_account_age_days: Integer,
          filter_language: String,
          filter_min_followers: Integer,
          must_follow_username: String,
          must_retweet: T::Boolean,
          required_hashtags: T::Array[String],
          required_keywords: T::Array[String],
          required_mentions: T::Array[String],
          unique_authors_only: T::Boolean,
          winner_count: Integer,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        tweet_url:,
        backup_count: nil,
        filter_account_age_days: nil,
        filter_language: nil,
        filter_min_followers: nil,
        must_follow_username: nil,
        must_retweet: nil,
        required_hashtags: nil,
        required_keywords: nil,
        required_mentions: nil,
        unique_authors_only: nil,
        winner_count: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            tweet_url: String,
            backup_count: Integer,
            filter_account_age_days: Integer,
            filter_language: String,
            filter_min_followers: Integer,
            must_follow_username: String,
            must_retweet: T::Boolean,
            required_hashtags: T::Array[String],
            required_keywords: T::Array[String],
            required_mentions: T::Array[String],
            unique_authors_only: T::Boolean,
            winner_count: Integer,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
