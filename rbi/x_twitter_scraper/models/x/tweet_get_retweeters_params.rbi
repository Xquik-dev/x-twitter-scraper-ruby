# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetGetRetweetersParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::TweetGetRetweetersParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Match any comma-separated or line-separated bio term, ignoring case.
        sig { returns(T.nilable(String)) }
        attr_reader :bio_contains

        sig { params(bio_contains: String).void }
        attr_writer :bio_contains

        # Pagination cursor for retweeters
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Only return profiles with a location.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :has_location

        sig { params(has_location: T::Boolean).void }
        attr_writer :has_location

        # Only return profiles with a website.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :has_website

        sig { params(has_website: T::Boolean).void }
        attr_writer :has_website

        # Match a location substring, ignoring case.
        sig { returns(T.nilable(String)) }
        attr_reader :location_contains

        sig { params(location_contains: String).void }
        attr_writer :location_contains

        # Maximum follower count. Missing counts pass this maximum.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_followers

        sig { params(max_followers: Integer).void }
        attr_writer :max_followers

        # Maximum following count.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_following

        sig { params(max_following: Integer).void }
        attr_writer :max_following

        # Maximum post count. maxPosts is also accepted.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_statuses

        sig { params(max_statuses: Integer).void }
        attr_writer :max_statuses

        # Minimum account age in whole days.
        sig { returns(T.nilable(Integer)) }
        attr_reader :min_account_age_days

        sig { params(min_account_age_days: Integer).void }
        attr_writer :min_account_age_days

        # Minimum follower count. Filtering happens before billing.
        sig { returns(T.nilable(Integer)) }
        attr_reader :min_followers

        sig { params(min_followers: Integer).void }
        attr_writer :min_followers

        # Minimum following count.
        sig { returns(T.nilable(Integer)) }
        attr_reader :min_following

        sig { params(min_following: Integer).void }
        attr_writer :min_following

        # Minimum post count. minPosts is also accepted.
        sig { returns(T.nilable(Integer)) }
        attr_reader :min_statuses

        sig { params(min_statuses: Integer).void }
        attr_writer :min_statuses

        # Maximum user profiles requested from this page (20-200, default 200). Source,
        # filters, or credits can return fewer profiles. Keep requesting next_cursor while
        # has_next_page is true. Deprecated aliases remain accepted.
        sig { returns(T.nilable(Integer)) }
        attr_reader :page_size

        sig { params(page_size: Integer).void }
        attr_writer :page_size

        # Match a username substring, ignoring case.
        sig { returns(T.nilable(String)) }
        attr_reader :username_contains

        sig { params(username_contains: String).void }
        attr_writer :username_contains

        # Only return verified profiles.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :verified_only

        sig { params(verified_only: T::Boolean).void }
        attr_writer :verified_only

        # Match the verification type exactly, ignoring case.
        sig { returns(T.nilable(String)) }
        attr_reader :verified_type

        sig { params(verified_type: String).void }
        attr_writer :verified_type

        sig do
          params(
            id: String,
            bio_contains: String,
            cursor: String,
            has_location: T::Boolean,
            has_website: T::Boolean,
            location_contains: String,
            max_followers: Integer,
            max_following: Integer,
            max_statuses: Integer,
            min_account_age_days: Integer,
            min_followers: Integer,
            min_following: Integer,
            min_statuses: Integer,
            page_size: Integer,
            username_contains: String,
            verified_only: T::Boolean,
            verified_type: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # Match any comma-separated or line-separated bio term, ignoring case.
          bio_contains: nil,
          # Pagination cursor for retweeters
          cursor: nil,
          # Only return profiles with a location.
          has_location: nil,
          # Only return profiles with a website.
          has_website: nil,
          # Match a location substring, ignoring case.
          location_contains: nil,
          # Maximum follower count. Missing counts pass this maximum.
          max_followers: nil,
          # Maximum following count.
          max_following: nil,
          # Maximum post count. maxPosts is also accepted.
          max_statuses: nil,
          # Minimum account age in whole days.
          min_account_age_days: nil,
          # Minimum follower count. Filtering happens before billing.
          min_followers: nil,
          # Minimum following count.
          min_following: nil,
          # Minimum post count. minPosts is also accepted.
          min_statuses: nil,
          # Maximum user profiles requested from this page (20-200, default 200). Source,
          # filters, or credits can return fewer profiles. Keep requesting next_cursor while
          # has_next_page is true. Deprecated aliases remain accepted.
          page_size: nil,
          # Match a username substring, ignoring case.
          username_contains: nil,
          # Only return verified profiles.
          verified_only: nil,
          # Match the verification type exactly, ignoring case.
          verified_type: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              id: String,
              bio_contains: String,
              cursor: String,
              has_location: T::Boolean,
              has_website: T::Boolean,
              location_contains: String,
              max_followers: Integer,
              max_following: Integer,
              max_statuses: Integer,
              min_account_age_days: Integer,
              min_followers: Integer,
              min_following: Integer,
              min_statuses: Integer,
              page_size: Integer,
              username_contains: String,
              verified_only: T::Boolean,
              verified_type: String,
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
