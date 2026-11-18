# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::X#get_trends_history
    class XGetTrendsHistoryResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute from_time
      #   Start of the range as Xquik read it. A span such as 7d shows here as the time it
      #   counted back to.
      #
      #   @return [Time]
      required :from_time, Time, api_name: :fromTime

      # @!attribute to_time
      #   End of the range as Xquik read it, which the range leaves out. Without to, it is
      #   the time of the first request.
      #
      #   @return [Time]
      required :to_time, Time, api_name: :toTime

      # @!attribute snapshots
      #   1 stored list per step, oldest first. A step with no stored list is left out.
      #
      #   @return [Array<XTwitterScraper::Models::XGetTrendsHistoryResponse::Snapshot>]
      required :snapshots, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::XGetTrendsHistoryResponse::Snapshot] }

      # @!attribute count
      #   Lists returned & charged.
      #
      #   @return [Integer]
      required :count, Integer

      # @!attribute woeid
      #
      #   @return [Integer]
      required :woeid, Integer

      # @!attribute location
      #   The place the request named by country or location. Absent when it sent a woeid
      #   or named no place.
      #
      #   @return [XTwitterScraper::Models::TrendLocation, nil]
      optional :location, -> { XTwitterScraper::Models::TrendLocation }

      # @!attribute has_next_page
      #   Whether the range holds more lists.
      #
      #   @return [Boolean]
      required :has_next_page, XTwitterScraper::Internal::Type::Boolean

      # @!attribute next_cursor
      #   Send it as cursor for the next lists. Empty on the last page.
      #
      #   @return [String]
      required :next_cursor, String

      # @!method initialize(from_time:, to_time:, snapshots:, count:, woeid:, has_next_page:, next_cursor:, location: nil)
      #   @param from_time [Time] Start of the range as Xquik read it. A span such as 7d shows here as the time it counted back to.
      #
      #   @param to_time [Time] End of the range as Xquik read it, which the range leaves out. Without to, it is the time of the first request.
      #
      #   @param snapshots [Array<XTwitterScraper::Models::XGetTrendsHistoryResponse::Snapshot>] 1 stored list per step, oldest first. A step with no stored list is left out.
      #
      #   @param count [Integer] Lists returned & charged.
      #
      #   @param woeid [Integer]
      #
      #   @param has_next_page [Boolean] Whether the range holds more lists.
      #
      #   @param next_cursor [String] Send it as cursor for the next lists. Empty on the last page.
      #
      #   @param location [XTwitterScraper::Models::TrendLocation] The place the request named by country or location. Absent when it sent a woeid or named no place.

      class Snapshot < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute captured_at
        #   When Xquik read this stored list from X. Xquik never estimates it.
        #
        #   @return [Time]
        required :captured_at, Time, api_name: :capturedAt

        # @!attribute count
        #   Trends in this list.
        #
        #   @return [Integer]
        required :count, Integer

        # @!attribute trends
        #
        #   @return [Array<XTwitterScraper::Models::XGetTrendsHistoryResponse::Snapshot::Trend>]
        required :trends, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::XGetTrendsHistoryResponse::Snapshot::Trend] }

        # @!method initialize(captured_at:, count:, trends:)
        #   @param captured_at [Time] When Xquik read this stored list from X. Xquik never estimates it.
        #
        #   @param count [Integer] Trends in this list.
        #
        #   @param trends [Array<XTwitterScraper::Models::XGetTrendsHistoryResponse::Snapshot::Trend>]

        class Trend < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute description
          #
          #   @return [String, nil]
          optional :description, String

          # @!attribute query
          #
          #   @return [String, nil]
          optional :query, String

          # @!attribute promoted_content
          #   X's promotion ID of a promoted trend. Null for the others.
          #
          #   @return [String, nil]
          optional :promoted_content, String, api_name: :promotedContent, nil?: true

          # @!attribute rank
          #   The trend's place in X's list at that time.
          #
          #   @return [Integer, nil]
          optional :rank, Integer

          # @!attribute tweet_volume
          #   X's post count for the trend at that time, when X showed one.
          #
          #   @return [Integer, nil]
          optional :tweet_volume, Integer, api_name: :tweetVolume, nil?: true

          # @!attribute url
          #   The trend's search link on X.
          #
          #   @return [String, nil]
          optional :url, String

          # @!method initialize(name:, description: nil, query: nil, promoted_content: nil, rank: nil, tweet_volume: nil, url: nil)
          #   @param name [String]
          #
          #   @param description [String]
          #
          #   @param query [String]
          #
          #   @param promoted_content [String, nil] X's promotion ID of a promoted trend. Null for the others.
          #
          #   @param rank [Integer] The trend's place in X's list at that time.
          #
          #   @param tweet_volume [Integer, nil] X's post count for the trend at that time, when X showed one.
          #
          #   @param url [String] The trend's search link on X.
        end
      end
    end
  end
end
