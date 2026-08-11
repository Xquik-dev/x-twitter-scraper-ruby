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

      # Require a non-empty description.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :has_description

      sig { params(has_description: T::Boolean).void }
      attr_writer :has_description

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

      # Filter by language code.
      sig { returns(T.nilable(String)) }
      attr_reader :lang

      sig { params(lang: String).void }
      attr_writer :lang

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
          has_description: T::Boolean,
          has_location: T::Boolean,
          has_media: T::Boolean,
          lang: String,
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
        # Require a non-empty description.
        has_description: nil,
        # Require a non-empty location.
        has_location: nil,
        # Require media.
        has_media: nil,
        # Filter by language code.
        lang: nil,
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
            has_description: T::Boolean,
            has_location: T::Boolean,
            has_media: T::Boolean,
            lang: String,
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
    end
  end
end
