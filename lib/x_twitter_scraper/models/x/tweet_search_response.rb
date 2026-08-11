# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # No-mode search, user Tweet, user reply, and direct reply reads use automatic
      # coverage. Shape, filters, aliases, and billing stay compatible. Unprefixed
      # cursors remain legacy. Follow next_cursor while has_next_page is true. An empty
      # filtered page can still have has_next_page true.
      #
      # @see XTwitterScraper::Resources::X::Tweets#search
      module TweetSearchResponse
        extend XTwitterScraper::Internal::Type::Union

        # No-mode search, user Tweet, user reply, and direct reply reads use automatic coverage. Shape, filters, aliases, and billing stay compatible. Unprefixed cursors remain legacy. Follow next_cursor while has_next_page is true. An empty filtered page can still have has_next_page true.
        variant -> { XTwitterScraper::PaginatedTweets }

        # No-mode search, user Tweet, user reply, and direct reply reads use automatic coverage. Shape, filters, aliases, and billing stay compatible. Unprefixed cursors remain legacy. Follow next_cursor while has_next_page is true. An empty filtered page can still have has_next_page true.
        variant -> { XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse }

        class TweetSearchCoverageResponse < XTwitterScraper::Models::PaginatedTweets
          # @!attribute diagnostic
          #   Coverage evidence across parallel search strategies.
          #
          #   @return [XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic]
          required :diagnostic,
                   -> { XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic }

          # @!attribute has_next_page
          #
          #   @return [Boolean, XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::HasNextPage, nil]
          optional :has_next_page,
                   enum: -> { XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::HasNextPage }

          # @!attribute next_cursor
          #
          #   @return [Symbol, XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::NextCursor, nil]
          optional :next_cursor,
                   enum: -> { XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::NextCursor }

          # @!method initialize(diagnostic:, has_next_page: nil, next_cursor: nil)
          #   No-mode search, user Tweet, user reply, and direct reply reads use automatic
          #   coverage. Shape, filters, aliases, and billing stay compatible. Unprefixed
          #   cursors remain legacy. Follow next_cursor while has_next_page is true. An empty
          #   filtered page can still have has_next_page true.
          #
          #   @param diagnostic [XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic] Coverage evidence across parallel search strategies.
          #
          #   @param has_next_page [Boolean, XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::HasNextPage]
          #
          #   @param next_cursor [Symbol, XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::NextCursor]

          class Diagnostic < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute complete
            #   True when every strategy exhausted its source.
            #
            #   @return [Boolean]
            required :complete, XTwitterScraper::Internal::Type::Boolean

            # @!attribute cursor_failure_count
            #
            #   @return [Integer]
            required :cursor_failure_count, Integer, api_name: :cursorFailureCount

            # @!attribute deadline_reached
            #
            #   @return [Boolean]
            required :deadline_reached, XTwitterScraper::Internal::Type::Boolean, api_name: :deadlineReached

            # @!attribute duplicate_count
            #
            #   @return [Integer]
            required :duplicate_count, Integer, api_name: :duplicateCount

            # @!attribute failed_strategy_count
            #
            #   @return [Integer]
            required :failed_strategy_count, Integer, api_name: :failedStrategyCount

            # @!attribute malformed_count
            #
            #   @return [Integer]
            required :malformed_count, Integer, api_name: :malformedCount

            # @!attribute pages_fetched
            #
            #   @return [Integer]
            required :pages_fetched, Integer, api_name: :pagesFetched

            # @!attribute partitioned
            #   Whether bounded time windows ran in parallel.
            #
            #   @return [Boolean]
            required :partitioned, XTwitterScraper::Internal::Type::Boolean

            # @!attribute response_truncated
            #   Whether credits or the requested limit reduced output.
            #
            #   @return [Boolean]
            required :response_truncated,
                     XTwitterScraper::Internal::Type::Boolean,
                     api_name: :responseTruncated

            # @!attribute result_limit_reached
            #
            #   @return [Boolean]
            required :result_limit_reached,
                     XTwitterScraper::Internal::Type::Boolean,
                     api_name: :resultLimitReached

            # @!attribute returned_tweets
            #
            #   @return [Integer]
            required :returned_tweets, Integer, api_name: :returnedTweets

            # @!attribute stalled_strategy_count
            #
            #   @return [Integer]
            required :stalled_strategy_count, Integer, api_name: :stalledStrategyCount

            # @!attribute strategies
            #
            #   @return [Array<XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy>]
            required :strategies,
                     -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy] }

            # @!attribute strategy_count
            #
            #   @return [Integer]
            required :strategy_count, Integer, api_name: :strategyCount

            # @!attribute unique_tweets
            #
            #   @return [Integer]
            required :unique_tweets, Integer, api_name: :uniqueTweets

            # @!method initialize(complete:, cursor_failure_count:, deadline_reached:, duplicate_count:, failed_strategy_count:, malformed_count:, pages_fetched:, partitioned:, response_truncated:, result_limit_reached:, returned_tweets:, stalled_strategy_count:, strategies:, strategy_count:, unique_tweets:)
            #   Coverage evidence across parallel search strategies.
            #
            #   @param complete [Boolean] True when every strategy exhausted its source.
            #
            #   @param cursor_failure_count [Integer]
            #
            #   @param deadline_reached [Boolean]
            #
            #   @param duplicate_count [Integer]
            #
            #   @param failed_strategy_count [Integer]
            #
            #   @param malformed_count [Integer]
            #
            #   @param pages_fetched [Integer]
            #
            #   @param partitioned [Boolean] Whether bounded time windows ran in parallel.
            #
            #   @param response_truncated [Boolean] Whether credits or the requested limit reduced output.
            #
            #   @param result_limit_reached [Boolean]
            #
            #   @param returned_tweets [Integer]
            #
            #   @param stalled_strategy_count [Integer]
            #
            #   @param strategies [Array<XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy>]
            #
            #   @param strategy_count [Integer]
            #
            #   @param unique_tweets [Integer]

            class Strategy < XTwitterScraper::Internal::Type::BaseModel
              # @!attribute duplicate_count
              #
              #   @return [Integer]
              required :duplicate_count, Integer, api_name: :duplicateCount

              # @!attribute pages_fetched
              #
              #   @return [Integer]
              required :pages_fetched, Integer, api_name: :pagesFetched

              # @!attribute query_type
              #
              #   @return [Symbol, XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::QueryType]
              required :query_type,
                       enum: -> { XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::QueryType },
                       api_name: :queryType

              # @!attribute stop_reason
              #
              #   @return [Symbol, XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::StopReason]
              required :stop_reason,
                       enum: -> { XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::StopReason },
                       api_name: :stopReason

              # @!attribute strategy
              #
              #   @return [Integer]
              required :strategy, Integer

              # @!attribute unique_added
              #
              #   @return [Integer]
              required :unique_added, Integer, api_name: :uniqueAdded

              # @!attribute window
              #   Non-overlapping time partition used by one strategy.
              #
              #   @return [XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::Window, nil]
              optional :window,
                       -> { XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::Window }

              # @!method initialize(duplicate_count:, pages_fetched:, query_type:, stop_reason:, strategy:, unique_added:, window: nil)
              #   @param duplicate_count [Integer]
              #
              #   @param pages_fetched [Integer]
              #
              #   @param query_type [Symbol, XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::QueryType]
              #
              #   @param stop_reason [Symbol, XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::StopReason]
              #
              #   @param strategy [Integer]
              #
              #   @param unique_added [Integer]
              #
              #   @param window [XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::Window] Non-overlapping time partition used by one strategy.

              # @see XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy#query_type
              module QueryType
                extend XTwitterScraper::Internal::Type::Enum

                LATEST = :Latest
                TOP = :Top

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy#stop_reason
              module StopReason
                extend XTwitterScraper::Internal::Type::Enum

                CURSOR_FAILURE = :cursor_failure
                DEADLINE = :deadline
                EXHAUSTED = :exhausted
                FAILED = :failed
                PAGE_LIMIT = :page_limit
                RESULT_LIMIT = :result_limit
                STALLED = :stalled

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy#window
              class Window < XTwitterScraper::Internal::Type::BaseModel
                # @!attribute since_time
                #
                #   @return [Time]
                required :since_time, Time, api_name: :sinceTime

                # @!attribute until_time
                #
                #   @return [Time]
                required :until_time, Time, api_name: :untilTime

                # @!method initialize(since_time:, until_time:)
                #   Non-overlapping time partition used by one strategy.
                #
                #   @param since_time [Time]
                #   @param until_time [Time]
              end
            end
          end

          module HasNextPage
            extend XTwitterScraper::Internal::Type::Enum

            FALSE = false

            # @!method self.values
            #   @return [Array<Boolean>]
          end

          module NextCursor
            extend XTwitterScraper::Internal::Type::Enum

            EMPTY = :""

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        # @!method self.variants
        #   @return [Array(XTwitterScraper::Models::PaginatedTweets, XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse)]
      end
    end
  end
end
