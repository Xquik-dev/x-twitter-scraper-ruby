# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class UserRetrieveSubscriptionsParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::UserRetrieveSubscriptionsParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # Pagination cursor for collection results. Also read as next_cursor, next_token,
        # pagination_token or continuation_token.
        sig { returns(T.nilable(String)) }
        attr_reader :cursor

        sig { params(cursor: String).void }
        attr_writer :cursor

        # Profiles to request from this page. A page holds up to 10,000, so a larger
        # pageSize gets the largest page. Default 200. Source, filters or credits can
        # return fewer. Follow next_cursor for more pages. Its aliases are limit, count,
        # max_results, maxItems, max_items & per_page.
        sig { returns(T.nilable(Integer)) }
        attr_reader :page_size

        sig { params(page_size: Integer).void }
        attr_writer :page_size

        # Minimum follower count. Profiles the filter drops cost nothing.
        sig { returns(T.nilable(Integer)) }
        attr_reader :min_followers

        sig { params(min_followers: Integer).void }
        attr_writer :min_followers

        # Maximum follower count. A profile without a count passes.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_followers

        sig { params(max_followers: Integer).void }
        attr_writer :max_followers

        # Profiles must follow at least this many accounts.
        sig { returns(T.nilable(Integer)) }
        attr_reader :min_following

        sig { params(min_following: Integer).void }
        attr_writer :min_following

        # Profiles may follow at most this many accounts.
        sig { returns(T.nilable(Integer)) }
        attr_reader :max_following

        sig { params(max_following: Integer).void }
        attr_writer :max_following

        # Minimum post count. minPosts is also accepted.
        sig { returns(T.nilable(Integer)) }
        attr_reader :min_statuses

        sig { params(min_statuses: Integer).void }
        attr_writer :min_statuses

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

        # Only return verified profiles.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :verified_only

        sig { params(verified_only: T::Boolean).void }
        attr_writer :verified_only

        # Only return profiles X marks as blue verified. X marks many business &
        # government accounts blue too. Use verifiedType for 1 badge type.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :blue_verified_only

        sig { params(blue_verified_only: T::Boolean).void }
        attr_writer :blue_verified_only

        # Match the verification type exactly, ignoring case.
        sig { returns(T.nilable(String)) }
        attr_reader :verified_type

        sig { params(verified_type: String).void }
        attr_writer :verified_type

        # Only return profiles with a website.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :has_website

        sig { params(has_website: T::Boolean).void }
        attr_writer :has_website

        # Only return profiles with a location.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :has_location

        sig { params(has_location: T::Boolean).void }
        attr_writer :has_location

        # Only return profiles that publish an email.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :has_email

        sig { params(has_email: T::Boolean).void }
        attr_writer :has_email

        # Only return profiles that publish an email outside free webmail, such as Gmail.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :business_email_only

        sig { params(business_email_only: T::Boolean).void }
        attr_writer :business_email_only

        # Only return profiles with an email at one of these domains. Separate domains
        # with commas. Subdomains match.
        sig { returns(T.nilable(String)) }
        attr_reader :email_domains

        sig { params(email_domains: String).void }
        attr_writer :email_domains

        # Match any comma-separated or line-separated bio term, ignoring case.
        sig { returns(T.nilable(String)) }
        attr_reader :bio_contains

        sig { params(bio_contains: String).void }
        attr_writer :bio_contains

        # Match a location substring, ignoring case.
        sig { returns(T.nilable(String)) }
        attr_reader :location_contains

        sig { params(location_contains: String).void }
        attr_writer :location_contains

        # Match a username substring, ignoring case.
        sig { returns(T.nilable(String)) }
        attr_reader :username_contains

        sig { params(username_contains: String).void }
        attr_writer :username_contains

        # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
        # author.username. A list keeps the field in each item. Case & underscores do not
        # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
        # always stay. An unknown name answers 400 unknown_field with the valid names,
        # before any read. The price stays the same. SDK row types then hold only the
        # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
        # the fields you need with `fields` & `omit`.
        sig { returns(T.nilable(String)) }
        attr_reader :fields

        sig { params(fields: String).void }
        attr_writer :fields

        # Fields to drop from each row, comma-separated. It takes the same names as
        # fields. With fields, it drops from the kept fields. A longer URL fails at the
        # edge before Xquik reads it.
        sig { returns(T.nilable(String)) }
        attr_reader :omit

        sig { params(omit: String).void }
        attr_writer :omit

        sig do
          params(
            id: String,
            cursor: String,
            page_size: Integer,
            min_followers: Integer,
            max_followers: Integer,
            min_following: Integer,
            max_following: Integer,
            min_statuses: Integer,
            max_statuses: Integer,
            min_account_age_days: Integer,
            verified_only: T::Boolean,
            blue_verified_only: T::Boolean,
            verified_type: String,
            has_website: T::Boolean,
            has_location: T::Boolean,
            has_email: T::Boolean,
            business_email_only: T::Boolean,
            email_domains: String,
            bio_contains: String,
            location_contains: String,
            username_contains: String,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # Pagination cursor for collection results. Also read as next_cursor, next_token,
          # pagination_token or continuation_token.
          cursor: nil,
          # Profiles to request from this page. A page holds up to 10,000, so a larger
          # pageSize gets the largest page. Default 200. Source, filters or credits can
          # return fewer. Follow next_cursor for more pages. Its aliases are limit, count,
          # max_results, maxItems, max_items & per_page.
          page_size: nil,
          # Minimum follower count. Profiles the filter drops cost nothing.
          min_followers: nil,
          # Maximum follower count. A profile without a count passes.
          max_followers: nil,
          # Profiles must follow at least this many accounts.
          min_following: nil,
          # Profiles may follow at most this many accounts.
          max_following: nil,
          # Minimum post count. minPosts is also accepted.
          min_statuses: nil,
          # Maximum post count. maxPosts is also accepted.
          max_statuses: nil,
          # Minimum account age in whole days.
          min_account_age_days: nil,
          # Only return verified profiles.
          verified_only: nil,
          # Only return profiles X marks as blue verified. X marks many business &
          # government accounts blue too. Use verifiedType for 1 badge type.
          blue_verified_only: nil,
          # Match the verification type exactly, ignoring case.
          verified_type: nil,
          # Only return profiles with a website.
          has_website: nil,
          # Only return profiles with a location.
          has_location: nil,
          # Only return profiles that publish an email.
          has_email: nil,
          # Only return profiles that publish an email outside free webmail, such as Gmail.
          business_email_only: nil,
          # Only return profiles with an email at one of these domains. Separate domains
          # with commas. Subdomains match.
          email_domains: nil,
          # Match any comma-separated or line-separated bio term, ignoring case.
          bio_contains: nil,
          # Match a location substring, ignoring case.
          location_contains: nil,
          # Match a username substring, ignoring case.
          username_contains: nil,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              id: String,
              cursor: String,
              page_size: Integer,
              min_followers: Integer,
              max_followers: Integer,
              min_following: Integer,
              max_following: Integer,
              min_statuses: Integer,
              max_statuses: Integer,
              min_account_age_days: Integer,
              verified_only: T::Boolean,
              blue_verified_only: T::Boolean,
              verified_type: String,
              has_website: T::Boolean,
              has_location: T::Boolean,
              has_email: T::Boolean,
              business_email_only: T::Boolean,
              email_domains: String,
              bio_contains: String,
              location_contains: String,
              username_contains: String,
              fields: String,
              omit: String,
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
