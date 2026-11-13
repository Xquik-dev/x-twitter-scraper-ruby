# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class PaginatedTweets < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute has_next_page
      #
      #   @return [Boolean]
      required :has_next_page, XTwitterScraper::Internal::Type::Boolean

      # @!attribute next_cursor
      #
      #   @return [String]
      required :next_cursor, String

      # @!attribute tweets
      #
      #   @return [Array<XTwitterScraper::Models::SearchTweet>]
      required :tweets, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::SearchTweet] }

      # @!attribute filtered_count
      #   Whole number from 0.
      #
      #   @return [Integer, nil]
      optional :filtered_count, Integer

      # @!attribute read_back_to
      #   The UTC time this filtered search has reached.
      #
      #   @return [Time, nil]
      optional :read_back_to, Time, api_name: :readBackTo

      # @!attribute search_context
      #   What X shows beside a search's posts, the same for everyone. Present on a search
      #   for a cashtag X has a card for, such as $BTC. Cashtag searches add X's ticker
      #   card in `searchContext`.
      #
      #   @return [XTwitterScraper::Models::PaginatedTweets::SearchContext, nil]
      optional :search_context,
               -> { XTwitterScraper::PaginatedTweets::SearchContext },
               api_name: :searchContext

      # @!attribute searched_query
      #   The query that ran, when it differs from your q.
      #
      #   @return [String, nil]
      optional :searched_query, String, api_name: :searchedQuery

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

      # @!method initialize(has_next_page:, next_cursor:, tweets:, filtered_count: nil, read_back_to: nil, search_context: nil, searched_query: nil, window_complete: nil, hidden_timeline: nil)
      #   No-mode search, user Tweet, user reply, and direct reply reads use automatic
      #   coverage. Shape, filters, aliases, and billing stay compatible. Unprefixed
      #   cursors remain legacy. Follow next_cursor while has_next_page is true. An empty
      #   filtered page can still have has_next_page true.
      #
      #   @param has_next_page [Boolean]
      #   @param next_cursor [String]
      #   @param tweets [Array<XTwitterScraper::Models::SearchTweet>]
      #   @param filtered_count [Integer] Whole number from 0.
      #   @param read_back_to [Time] The UTC time this filtered search has reached.
      #   @param search_context [XTwitterScraper::Models::PaginatedTweets::SearchContext] What X shows beside a search's posts, the same for everyone. Present on a search
      #   @param searched_query [String] The query that ran, when it differs from your q.
      #   @param window_complete [Boolean] Present on a last page whose sources all read past its start time.
      #   @param hidden_timeline [Boolean] Present on an empty last page when X shows this account's timeline to nobody. The page is empty because of that, so it doesn't mean the account posted nothing. A retry returns the same page.

      # @see XTwitterScraper::Models::PaginatedTweets#search_context
      class SearchContext < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute smart_tag
        #   X's card for the cashtag the search names.
        #
        #   @return [XTwitterScraper::Models::PaginatedTweets::SearchContext::SmartTag]
        required :smart_tag,
                 -> { XTwitterScraper::PaginatedTweets::SearchContext::SmartTag },
                 api_name: :smartTag

        # @!method initialize(smart_tag:)
        #   What X shows beside a search's posts, the same for everyone. Present on a search
        #   for a cashtag X has a card for, such as $BTC. Cashtag searches add X's ticker
        #   card in `searchContext`.
        #
        #   @param smart_tag [XTwitterScraper::Models::PaginatedTweets::SearchContext::SmartTag] X's card for the cashtag the search names.

        # @see XTwitterScraper::Models::PaginatedTweets::SearchContext#smart_tag
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
