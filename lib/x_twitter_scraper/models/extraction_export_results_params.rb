# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Extractions#export_results
    class ExtractionExportResultsParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute format_
      #   Export file format
      #
      #   @return [Symbol, XTwitterScraper::Models::ExtractionExportResultsParams::Format]
      required :format_, enum: -> { XTwitterScraper::ExtractionExportResultsParams::Format }

      # @!attribute has_description
      #   Require a non-empty description.
      #
      #   @return [Boolean, nil]
      optional :has_description, XTwitterScraper::Internal::Type::Boolean

      # @!attribute has_location
      #   Require a non-empty location.
      #
      #   @return [Boolean, nil]
      optional :has_location, XTwitterScraper::Internal::Type::Boolean

      # @!attribute has_media
      #   Require media.
      #
      #   @return [Boolean, nil]
      optional :has_media, XTwitterScraper::Internal::Type::Boolean

      # @!attribute lang
      #   Filter by language code.
      #
      #   @return [String, nil]
      optional :lang, String

      # @!attribute max_followers
      #   Maximum follower count.
      #
      #   @return [Integer, nil]
      optional :max_followers, Integer

      # @!attribute max_following
      #   Maximum following count.
      #
      #   @return [Integer, nil]
      optional :max_following, Integer

      # @!attribute max_posts
      #   Maximum post count.
      #
      #   @return [Integer, nil]
      optional :max_posts, Integer

      # @!attribute min_followers
      #   Minimum follower count.
      #
      #   @return [Integer, nil]
      optional :min_followers, Integer

      # @!attribute min_following
      #   Minimum following count.
      #
      #   @return [Integer, nil]
      optional :min_following, Integer

      # @!attribute min_likes
      #   Minimum like count.
      #
      #   @return [Integer, nil]
      optional :min_likes, Integer

      # @!attribute min_posts
      #   Minimum post count.
      #
      #   @return [Integer, nil]
      optional :min_posts, Integer

      # @!attribute min_replies
      #   Minimum reply count.
      #
      #   @return [Integer, nil]
      optional :min_replies, Integer

      # @!attribute min_retweets
      #   Minimum repost count.
      #
      #   @return [Integer, nil]
      optional :min_retweets, Integer

      # @!attribute min_views
      #   Minimum view count.
      #
      #   @return [Integer, nil]
      optional :min_views, Integer

      # @!attribute search
      #   Search exported result text.
      #
      #   @return [String, nil]
      optional :search, String

      # @!attribute since_date
      #   Include results on or after this date.
      #
      #   @return [Date, nil]
      optional :since_date, Date

      # @!attribute until_date
      #   Include results on or before this date.
      #
      #   @return [Date, nil]
      optional :until_date, Date

      # @!attribute verified
      #   Filter by verified status.
      #
      #   @return [Boolean, nil]
      optional :verified, XTwitterScraper::Internal::Type::Boolean

      # @!method initialize(id:, format_:, has_description: nil, has_location: nil, has_media: nil, lang: nil, max_followers: nil, max_following: nil, max_posts: nil, min_followers: nil, min_following: nil, min_likes: nil, min_posts: nil, min_replies: nil, min_retweets: nil, min_views: nil, search: nil, since_date: nil, until_date: nil, verified: nil, request_options: {})
      #   @param id [String]
      #
      #   @param format_ [Symbol, XTwitterScraper::Models::ExtractionExportResultsParams::Format] Export file format
      #
      #   @param has_description [Boolean] Require a non-empty description.
      #
      #   @param has_location [Boolean] Require a non-empty location.
      #
      #   @param has_media [Boolean] Require media.
      #
      #   @param lang [String] Filter by language code.
      #
      #   @param max_followers [Integer] Maximum follower count.
      #
      #   @param max_following [Integer] Maximum following count.
      #
      #   @param max_posts [Integer] Maximum post count.
      #
      #   @param min_followers [Integer] Minimum follower count.
      #
      #   @param min_following [Integer] Minimum following count.
      #
      #   @param min_likes [Integer] Minimum like count.
      #
      #   @param min_posts [Integer] Minimum post count.
      #
      #   @param min_replies [Integer] Minimum reply count.
      #
      #   @param min_retweets [Integer] Minimum repost count.
      #
      #   @param min_views [Integer] Minimum view count.
      #
      #   @param search [String] Search exported result text.
      #
      #   @param since_date [Date] Include results on or after this date.
      #
      #   @param until_date [Date] Include results on or before this date.
      #
      #   @param verified [Boolean] Filter by verified status.
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

      # Export file format
      module Format
        extend XTwitterScraper::Internal::Type::Enum

        CSV = :csv
        JSON = :json
        MD = :md
        MD_DOCUMENT = :"md-document"
        PDF = :pdf
        TXT = :txt
        XLSX = :xlsx

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
