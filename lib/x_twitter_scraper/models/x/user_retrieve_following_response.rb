# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # Paginated user profiles. No-mode follower, following, and verified follower
      # requests merge independent views automatically. Response fields, page size,
      # aliases, filters, and per-returned-profile billing stay unchanged. Existing
      # unprefixed cursors retain legacy behavior. Follow next_cursor while
      # has_next_page is true.
      #
      # @see XTwitterScraper::Resources::X::Users#retrieve_following
      module UserRetrieveFollowingResponse
        extend XTwitterScraper::Internal::Type::Union

        # Paginated user profiles. No-mode follower, following, and verified follower requests merge independent views automatically. Response fields, page size, aliases, filters, and per-returned-profile billing stay unchanged. Existing unprefixed cursors retain legacy behavior. Follow next_cursor while has_next_page is true.
        variant -> { XTwitterScraper::PaginatedUsers }

        # Paginated user profiles. No-mode follower, following, and verified follower requests merge independent views automatically. Response fields, page size, aliases, filters, and per-returned-profile billing stay unchanged. Existing unprefixed cursors retain legacy behavior. Follow next_cursor while has_next_page is true.
        variant -> { XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse }

        class UserListCoverageResponse < XTwitterScraper::Models::PaginatedUsers
          # @!attribute diagnostic
          #   Coverage evidence across parallel relationship strategies.
          #
          #   @return [XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic]
          required :diagnostic,
                   -> { XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic }

          # @!attribute has_next_page
          #
          #   @return [Boolean, XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::HasNextPage, nil]
          optional :has_next_page,
                   enum: -> { XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::HasNextPage }

          # @!attribute next_cursor
          #
          #   @return [Symbol, XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::NextCursor, nil]
          optional :next_cursor,
                   enum: -> { XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::NextCursor }

          # @!method initialize(diagnostic:, has_next_page: nil, next_cursor: nil)
          #   Paginated user profiles. No-mode follower, following, and verified follower
          #   requests merge independent views automatically. Response fields, page size,
          #   aliases, filters, and per-returned-profile billing stay unchanged. Existing
          #   unprefixed cursors retain legacy behavior. Follow next_cursor while
          #   has_next_page is true.
          #
          #   @param diagnostic [XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic] Coverage evidence across parallel relationship strategies.
          #
          #   @param has_next_page [Boolean, XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::HasNextPage]
          #
          #   @param next_cursor [Symbol, XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::NextCursor]

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

            # @!attribute returned_users
            #
            #   @return [Integer]
            required :returned_users, Integer, api_name: :returnedUsers

            # @!attribute stalled_strategy_count
            #
            #   @return [Integer]
            required :stalled_strategy_count, Integer, api_name: :stalledStrategyCount

            # @!attribute strategies
            #
            #   @return [Array<XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::Strategy>]
            required :strategies,
                     -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::Strategy] }

            # @!attribute strategy_count
            #
            #   @return [Integer]
            required :strategy_count, Integer, api_name: :strategyCount

            # @!attribute unique_users
            #
            #   @return [Integer]
            required :unique_users, Integer, api_name: :uniqueUsers

            # @!method initialize(complete:, cursor_failure_count:, deadline_reached:, duplicate_count:, failed_strategy_count:, malformed_count:, pages_fetched:, response_truncated:, result_limit_reached:, returned_users:, stalled_strategy_count:, strategies:, strategy_count:, unique_users:)
            #   Coverage evidence across parallel relationship strategies.
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
            #   @param response_truncated [Boolean] Whether credits or the requested limit reduced output.
            #
            #   @param result_limit_reached [Boolean]
            #
            #   @param returned_users [Integer]
            #
            #   @param stalled_strategy_count [Integer]
            #
            #   @param strategies [Array<XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::Strategy>]
            #
            #   @param strategy_count [Integer]
            #
            #   @param unique_users [Integer]

            class Strategy < XTwitterScraper::Internal::Type::BaseModel
              # @!attribute duplicate_count
              #
              #   @return [Integer]
              required :duplicate_count, Integer, api_name: :duplicateCount

              # @!attribute pages_fetched
              #
              #   @return [Integer]
              required :pages_fetched, Integer, api_name: :pagesFetched

              # @!attribute stop_reason
              #
              #   @return [Symbol, XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::Strategy::StopReason]
              required :stop_reason,
                       enum: -> { XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::Strategy::StopReason },
                       api_name: :stopReason

              # @!attribute strategy
              #
              #   @return [Integer]
              required :strategy, Integer

              # @!attribute unique_added
              #
              #   @return [Integer]
              required :unique_added, Integer, api_name: :uniqueAdded

              # @!method initialize(duplicate_count:, pages_fetched:, stop_reason:, strategy:, unique_added:)
              #   @param duplicate_count [Integer]
              #   @param pages_fetched [Integer]
              #   @param stop_reason [Symbol, XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::Strategy::StopReason]
              #   @param strategy [Integer]
              #   @param unique_added [Integer]

              # @see XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::Strategy#stop_reason
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
        #   @return [Array(XTwitterScraper::Models::PaginatedUsers, XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse)]
      end
    end
  end
end
