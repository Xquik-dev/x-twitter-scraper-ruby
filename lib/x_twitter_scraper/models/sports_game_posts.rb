# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class SportsGamePosts < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute filtered_count
      #   Whole number from 0.
      #
      #   @return [Integer, nil]
      optional :filtered_count, Integer

      # @!attribute tweets
      #
      #   @return [Array<XTwitterScraper::Models::SearchTweet>]
      required :tweets, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::SearchTweet] }

      # @!attribute has_next_page
      #
      #   @return [Boolean]
      required :has_next_page, XTwitterScraper::Internal::Type::Boolean

      # @!attribute next_cursor
      #   Cursor for the next page. Send it unchanged. Each next page arrives fast.
      #
      #   @return [String]
      required :next_cursor, String

      # @!attribute end_reason
      #   Present on a last page that X cut short. `stalled` means X returned no new
      #   results 2 times in a row, 30 s apart. The list may hold more. Read it again
      #   later without cursor.
      #
      #   @return [Symbol, XTwitterScraper::Models::CoverageEndReason, nil]
      optional :end_reason, enum: -> { XTwitterScraper::Models::CoverageEndReason }, api_name: :endReason

      # @!attribute read_back_to
      #   The UTC time this filtered search has reached.
      #
      #   @return [Time, nil]
      optional :read_back_to, Time, api_name: :readBackTo

      # @!attribute window_complete
      #   Present on a last page whose sources all read past its start time.
      #
      #   @return [Boolean, nil]
      optional :window_complete, XTwitterScraper::Internal::Type::Boolean, api_name: :windowComplete

      # @!attribute hidden_timeline
      #   Present on an empty last page when X shows this account's timeline to nobody.
      #   The page is empty because of that, so it doesn't mean the account posted
      #   nothing. A retry returns the same page.
      #
      #   @return [Boolean, nil]
      optional :hidden_timeline, XTwitterScraper::Internal::Type::Boolean, api_name: :hiddenTimeline

      # @!attribute searched_query
      #   The query that ran, when it differs from your q.
      #
      #   @return [String, nil]
      optional :searched_query, String, api_name: :searchedQuery

      # @!attribute search_context
      #   What X shows beside a search's posts, the same for everyone. Present on a search
      #   for a cashtag X has a card for, such as $BTC. Cashtag searches add X's ticker
      #   card in `searchContext`.
      #
      #   @return [XTwitterScraper::Models::SportsGamePosts::SearchContext, nil]
      optional :search_context, -> { XTwitterScraper::Models::SportsGamePosts::SearchContext }, api_name: :searchContext

      # @!attribute query
      #   An X search for this game's posts, in the order asked. Send it to GET
      #   /x/tweets/search for more filters. Null when no search is available.
      #
      #   @return [String, nil]
      required :query, String, nil?: true

      # @!method initialize(tweets:, has_next_page:, next_cursor:, query:, filtered_count: nil, end_reason: nil, read_back_to: nil, window_complete: nil, hidden_timeline: nil, searched_query: nil, search_context: nil)
      #   A page of 1 game's posts, in Xquik's post shape. Pass next_cursor as cursor for
      #   the next page.
      #
      #   @param tweets [Array<XTwitterScraper::Models::SearchTweet>]
      #
      #   @param has_next_page [Boolean]
      #
      #   @param next_cursor [String] Cursor for the next page. Send it unchanged. Each next page arrives fast.
      #
      #   @param query [String, nil] An X search for this game's posts, in the order asked. Send it to GET /x/tweets/search for more filters. Null when no search is available.
      #
      #   @param filtered_count [Integer] Whole number from 0.
      #
      #   @param end_reason [Symbol, XTwitterScraper::Models::CoverageEndReason] Present on a last page that X cut short. `stalled` means X returned no new results 2 times in a row, 30 s apart. The list may hold more. Read it again later without cursor.
      #
      #   @param read_back_to [Time] The UTC time this filtered search has reached.
      #
      #   @param window_complete [Boolean] Present on a last page whose sources all read past its start time.
      #
      #   @param hidden_timeline [Boolean] Present on an empty last page when X shows this account's timeline to nobody. The page is empty because of that, so it doesn't mean the account posted nothing. A retry returns the same page.
      #
      #   @param searched_query [String] The query that ran, when it differs from your q.
      #
      #   @param search_context [XTwitterScraper::Models::SportsGamePosts::SearchContext] What X shows beside a search's posts, the same for everyone. Present on a search for a cashtag X has a card for, such as $BTC. Cashtag searches add X's ticker card in `searchContext`.

      class SearchContext < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute smart_tag
        #   X's card for the cashtag the search names.
        #
        #   @return [XTwitterScraper::Models::SportsGamePosts::SearchContext::SmartTag]
        required :smart_tag, -> { XTwitterScraper::Models::SportsGamePosts::SearchContext::SmartTag }, api_name: :smartTag

        # @!method initialize(smart_tag:)
        #   What X shows beside a search's posts, the same for everyone. Present on a search
        #   for a cashtag X has a card for, such as $BTC. Cashtag searches add X's ticker
        #   card in `searchContext`.
        #
        #   @param smart_tag [XTwitterScraper::Models::SportsGamePosts::SearchContext::SmartTag] X's card for the cashtag the search names.

        class SmartTag < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute id
          #   The ticker X matched.
          #
          #   @return [String]
          required :id, String

          # @!attribute active
          #   Whether X lists the ticker as active.
          #
          #   @return [Boolean, nil]
          optional :active, XTwitterScraper::Internal::Type::Boolean

          # @!attribute supports_ohlc
          #   Whether X charts the ticker with open, high, low & close prices.
          #
          #   @return [Boolean, nil]
          optional :supports_ohlc, XTwitterScraper::Internal::Type::Boolean, api_name: :supportsOhlc

          # @!method initialize(id:, active: nil, supports_ohlc: nil)
          #   X's card for the cashtag the search names.
          #
          #   @param id [String] The ticker X matched.
          #
          #   @param active [Boolean] Whether X lists the ticker as active.
          #
          #   @param supports_ohlc [Boolean] Whether X charts the ticker with open, high, low & close prices.
        end
      end
    end
  end
end
