# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class ExtractionExportResultsParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::ExtractionExportResultsParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      # Export file format
      sig do
        returns(
          XTwitterScraper::ExtractionExportResultsParams::Format::OrSymbol
        )
      end
      attr_accessor :format_

      # Require an email outside free webmail, such as Gmail, in the row's Email column.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :business_email_only

      sig { params(business_email_only: T::Boolean).void }
      attr_writer :business_email_only

      # With compare, `added` keeps this run's new rows and `removed` keeps the earlier
      # run's rows that this run lacks. The default is `added`. A run of another account
      # ignores it.
      sig do
        returns(
          T.nilable(
            XTwitterScraper::ExtractionExportResultsParams::Change::OrSymbol
          )
        )
      end
      attr_reader :change

      sig do
        params(
          change:
            XTwitterScraper::ExtractionExportResultsParams::Change::OrSymbol
        ).void
      end
      attr_writer :change

      # ID of another run of this tool. For an earlier whole run of the same account,
      # the export holds only the rows that differ. For a run of another account, it
      # holds only this run's rows that the other run also lists.
      sig { returns(T.nilable(String)) }
      attr_reader :compare

      sig { params(compare: String).void }
      attr_writer :compare

      # Require the row's email at one of these domains. Separate domains with commas.
      # Subdomains match.
      sig { returns(T.nilable(String)) }
      attr_reader :email_domains

      sig { params(email_domains: String).void }
      attr_writer :email_domains

      # Require a non-empty description.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_description

      sig { params(has_description: T::Boolean).void }
      attr_writer :has_description

      # Require an email in the row's Email column.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_email

      sig { params(has_email: T::Boolean).void }
      attr_writer :has_email

      # Require a non-empty location.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_location

      sig { params(has_location: T::Boolean).void }
      attr_writer :has_location

      # Require media.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_media

      sig { params(has_media: T::Boolean).void }
      attr_writer :has_media

      # Require a website on the profile.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_website

      sig { params(has_website: T::Boolean).void }
      attr_writer :has_website

      # Drop accounts with at least 3 of these signs. No posts, a default picture, an
      # empty bio, or following at least 100 accounts and 10 times their followers.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :hide_fake

      sig { params(hide_fake: T::Boolean).void }
      attr_writer :hide_fake

      # Drop accounts with under 1 post a month since joining that are at least 180 days
      # old.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :hide_inactive

      sig { params(hide_inactive: T::Boolean).void }
      attr_writer :hide_inactive

      # Keep accounts that joined X on this UTC day or later.
      sig { returns(T.nilable(Date)) }
      attr_reader :joined_since

      sig { params(joined_since: Date).void }
      attr_writer :joined_since

      # Keep accounts that joined X before this UTC day.
      sig { returns(T.nilable(Date)) }
      attr_reader :joined_until

      sig { params(joined_until: Date).void }
      attr_writer :joined_until

      # Filter by language code.
      sig { returns(T.nilable(String)) }
      attr_reader :lang

      sig { params(lang: String).void }
      attr_writer :lang

      # Keep accounts whose location contains this text.
      sig { returns(T.nilable(String)) }
      attr_reader :location

      sig { params(location: String).void }
      attr_writer :location

      # Maximum follower count.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_followers

      sig { params(max_followers: Integer).void }
      attr_writer :max_followers

      # Maximum following count.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_following

      sig { params(max_following: Integer).void }
      attr_writer :max_following

      # Maximum post count.
      sig { returns(T.nilable(Integer)) }
      attr_reader :max_posts

      sig { params(max_posts: Integer).void }
      attr_writer :max_posts

      # Minimum follower count.
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_followers

      sig { params(min_followers: Integer).void }
      attr_writer :min_followers

      # Minimum following count.
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_following

      sig { params(min_following: Integer).void }
      attr_writer :min_following

      # Minimum like count.
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_likes

      sig { params(min_likes: Integer).void }
      attr_writer :min_likes

      # Minimum post count.
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_posts

      sig { params(min_posts: Integer).void }
      attr_writer :min_posts

      # Minimum reply count.
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_replies

      sig { params(min_replies: Integer).void }
      attr_writer :min_replies

      # Minimum repost count.
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_retweets

      sig { params(min_retweets: Integer).void }
      attr_writer :min_retweets

      # Minimum view count.
      sig { returns(T.nilable(Integer)) }
      attr_reader :min_views

      sig { params(min_views: Integer).void }
      attr_writer :min_views

      # Search exported result text.
      sig { returns(T.nilable(String)) }
      attr_reader :search

      sig { params(search: String).void }
      attr_writer :search

      # Include results on or after this date.
      sig { returns(T.nilable(Date)) }
      attr_reader :since_date

      sig { params(since_date: Date).void }
      attr_writer :since_date

      # Include results on or before this date.
      sig { returns(T.nilable(Date)) }
      attr_reader :until_date

      sig { params(until_date: Date).void }
      attr_writer :until_date

      # Filter by verified status.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :verified

      sig { params(verified: T::Boolean).void }
      attr_writer :verified

      sig do
        params(
          id: String,
          format_:
            XTwitterScraper::ExtractionExportResultsParams::Format::OrSymbol,
          business_email_only: T::Boolean,
          change:
            XTwitterScraper::ExtractionExportResultsParams::Change::OrSymbol,
          compare: String,
          email_domains: String,
          has_description: T::Boolean,
          has_email: T::Boolean,
          has_location: T::Boolean,
          has_media: T::Boolean,
          has_website: T::Boolean,
          hide_fake: T::Boolean,
          hide_inactive: T::Boolean,
          joined_since: Date,
          joined_until: Date,
          lang: String,
          location: String,
          max_followers: Integer,
          max_following: Integer,
          max_posts: Integer,
          min_followers: Integer,
          min_following: Integer,
          min_likes: Integer,
          min_posts: Integer,
          min_replies: Integer,
          min_retweets: Integer,
          min_views: Integer,
          search: String,
          since_date: Date,
          until_date: Date,
          verified: T::Boolean,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Export file format
        format_:,
        # Require an email outside free webmail, such as Gmail, in the row's Email column.
        business_email_only: nil,
        # With compare, `added` keeps this run's new rows and `removed` keeps the earlier
        # run's rows that this run lacks. The default is `added`. A run of another account
        # ignores it.
        change: nil,
        # ID of another run of this tool. For an earlier whole run of the same account,
        # the export holds only the rows that differ. For a run of another account, it
        # holds only this run's rows that the other run also lists.
        compare: nil,
        # Require the row's email at one of these domains. Separate domains with commas.
        # Subdomains match.
        email_domains: nil,
        # Require a non-empty description.
        has_description: nil,
        # Require an email in the row's Email column.
        has_email: nil,
        # Require a non-empty location.
        has_location: nil,
        # Require media.
        has_media: nil,
        # Require a website on the profile.
        has_website: nil,
        # Drop accounts with at least 3 of these signs. No posts, a default picture, an
        # empty bio, or following at least 100 accounts and 10 times their followers.
        hide_fake: nil,
        # Drop accounts with under 1 post a month since joining that are at least 180 days
        # old.
        hide_inactive: nil,
        # Keep accounts that joined X on this UTC day or later.
        joined_since: nil,
        # Keep accounts that joined X before this UTC day.
        joined_until: nil,
        # Filter by language code.
        lang: nil,
        # Keep accounts whose location contains this text.
        location: nil,
        # Maximum follower count.
        max_followers: nil,
        # Maximum following count.
        max_following: nil,
        # Maximum post count.
        max_posts: nil,
        # Minimum follower count.
        min_followers: nil,
        # Minimum following count.
        min_following: nil,
        # Minimum like count.
        min_likes: nil,
        # Minimum post count.
        min_posts: nil,
        # Minimum reply count.
        min_replies: nil,
        # Minimum repost count.
        min_retweets: nil,
        # Minimum view count.
        min_views: nil,
        # Search exported result text.
        search: nil,
        # Include results on or after this date.
        since_date: nil,
        # Include results on or before this date.
        until_date: nil,
        # Filter by verified status.
        verified: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            format_:
              XTwitterScraper::ExtractionExportResultsParams::Format::OrSymbol,
            business_email_only: T::Boolean,
            change:
              XTwitterScraper::ExtractionExportResultsParams::Change::OrSymbol,
            compare: String,
            email_domains: String,
            has_description: T::Boolean,
            has_email: T::Boolean,
            has_location: T::Boolean,
            has_media: T::Boolean,
            has_website: T::Boolean,
            hide_fake: T::Boolean,
            hide_inactive: T::Boolean,
            joined_since: Date,
            joined_until: Date,
            lang: String,
            location: String,
            max_followers: Integer,
            max_following: Integer,
            max_posts: Integer,
            min_followers: Integer,
            min_following: Integer,
            min_likes: Integer,
            min_posts: Integer,
            min_replies: Integer,
            min_retweets: Integer,
            min_views: Integer,
            search: String,
            since_date: Date,
            until_date: Date,
            verified: T::Boolean,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Export file format
      module Format
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              XTwitterScraper::ExtractionExportResultsParams::Format
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CSV =
          T.let(
            :csv,
            XTwitterScraper::ExtractionExportResultsParams::Format::TaggedSymbol
          )
        JSON =
          T.let(
            :json,
            XTwitterScraper::ExtractionExportResultsParams::Format::TaggedSymbol
          )
        MD =
          T.let(
            :md,
            XTwitterScraper::ExtractionExportResultsParams::Format::TaggedSymbol
          )
        MD_DOCUMENT =
          T.let(
            :"md-document",
            XTwitterScraper::ExtractionExportResultsParams::Format::TaggedSymbol
          )
        PDF =
          T.let(
            :pdf,
            XTwitterScraper::ExtractionExportResultsParams::Format::TaggedSymbol
          )
        TXT =
          T.let(
            :txt,
            XTwitterScraper::ExtractionExportResultsParams::Format::TaggedSymbol
          )
        XLSX =
          T.let(
            :xlsx,
            XTwitterScraper::ExtractionExportResultsParams::Format::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::ExtractionExportResultsParams::Format::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # With compare, `added` keeps this run's new rows and `removed` keeps the earlier
      # run's rows that this run lacks. The default is `added`. A run of another account
      # ignores it.
      module Change
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              XTwitterScraper::ExtractionExportResultsParams::Change
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ADDED =
          T.let(
            :added,
            XTwitterScraper::ExtractionExportResultsParams::Change::TaggedSymbol
          )
        REMOVED =
          T.let(
            :removed,
            XTwitterScraper::ExtractionExportResultsParams::Change::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::ExtractionExportResultsParams::Change::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
