# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

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

      # @!attribute business_email_only
      #   Require an email outside free webmail, such as Gmail, in the row's Email column.
      #
      #   @return [Boolean, nil]
      optional :business_email_only, XTwitterScraper::Internal::Type::Boolean

      # @!attribute compare
      #   ID of another run of this tool. For an earlier whole run of the same account,
      #   the export holds only the rows that differ. For a run of another account, it
      #   holds only this run's rows that the other run also lists.
      #
      #   @return [String, nil]
      optional :compare, String

      # @!attribute email_domains
      #   Require the row's email at one of these domains. Separate domains with commas.
      #   Subdomains match.
      #
      #   @return [String, nil]
      optional :email_domains, String

      # @!attribute has_description
      #   Require a non-empty description.
      #
      #   @return [Boolean, nil]
      optional :has_description, XTwitterScraper::Internal::Type::Boolean

      # @!attribute has_email
      #   Require an email in the row's Email column.
      #
      #   @return [Boolean, nil]
      optional :has_email, XTwitterScraper::Internal::Type::Boolean

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

      # @!attribute has_website
      #   Require a website on the profile.
      #
      #   @return [Boolean, nil]
      optional :has_website, XTwitterScraper::Internal::Type::Boolean

      # @!attribute hide_fake
      #   Drop accounts with at least 3 of these signs. No posts, a default picture, an
      #   empty bio, or following at least 100 accounts and 10 times their followers.
      #
      #   @return [Boolean, nil]
      optional :hide_fake, XTwitterScraper::Internal::Type::Boolean

      # @!attribute hide_inactive
      #   Drop accounts with under 1 post a month since joining that are at least 180 days
      #   old.
      #
      #   @return [Boolean, nil]
      optional :hide_inactive, XTwitterScraper::Internal::Type::Boolean

      # @!attribute joined_since
      #   Keep accounts that joined X on this UTC day or later.
      #
      #   @return [Date, nil]
      optional :joined_since, Date

      # @!attribute joined_until
      #   Keep accounts that joined X before this UTC day.
      #
      #   @return [Date, nil]
      optional :joined_until, Date

      # @!attribute lang
      #   Filter by language code.
      #
      #   @return [String, nil]
      optional :lang, String

      # @!attribute location
      #   Keep accounts whose location contains this text.
      #
      #   @return [String, nil]
      optional :location, String

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

      # @!method initialize(id:, format_:, business_email_only: nil, compare: nil, email_domains: nil, has_description: nil, has_email: nil, has_location: nil, has_media: nil, has_website: nil, hide_fake: nil, hide_inactive: nil, joined_since: nil, joined_until: nil, lang: nil, location: nil, max_followers: nil, max_following: nil, max_posts: nil, min_followers: nil, min_following: nil, min_likes: nil, min_posts: nil, min_replies: nil, min_retweets: nil, min_views: nil, search: nil, since_date: nil, until_date: nil, verified: nil, request_options: {})
      #   @param id [String]
      #
      #   @param format_ [Symbol, XTwitterScraper::Models::ExtractionExportResultsParams::Format] Export file format
      #
      #   @param business_email_only [Boolean] Require an email outside free webmail, such as Gmail, in the row's Email column.
      #
      #   @param compare [String] ID of another run of this tool. For an earlier whole run of the same account, th
      #
      #   @param email_domains [String] Require the row's email at one of these domains. Separate domains with commas. S
      #
      #   @param has_description [Boolean] Require a non-empty description.
      #
      #   @param has_email [Boolean] Require an email in the row's Email column.
      #
      #   @param has_location [Boolean] Require a non-empty location.
      #
      #   @param has_media [Boolean] Require media.
      #
      #   @param has_website [Boolean] Require a website on the profile.
      #
      #   @param hide_fake [Boolean] Drop accounts with at least 3 of these signs. No posts, a default picture, an em
      #
      #   @param hide_inactive [Boolean] Drop accounts with under 1 post a month since joining that are at least 180 days
      #
      #   @param joined_since [Date] Keep accounts that joined X on this UTC day or later.
      #
      #   @param joined_until [Date] Keep accounts that joined X before this UTC day.
      #
      #   @param lang [String] Filter by language code.
      #
      #   @param location [String] Keep accounts whose location contains this text.
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
