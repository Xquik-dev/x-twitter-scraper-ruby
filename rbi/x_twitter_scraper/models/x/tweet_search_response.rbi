# typed: strong

module XTwitterScraper
  module Models
    module X
      # No-mode search, user Tweet, user reply, and direct reply reads use automatic
      # coverage. Shape, filters, aliases, and billing stay compatible. Unprefixed
      # cursors remain legacy. Follow next_cursor while has_next_page is true. An empty
      # filtered page can still have has_next_page true.
      module TweetSearchResponse
        extend XTwitterScraper::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              XTwitterScraper::PaginatedTweets,
              XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse
            )
          end

        class TweetSearchCoverageResponse < XTwitterScraper::Models::PaginatedTweets
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Coverage evidence across parallel search strategies.
          sig do
            returns(
              XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic
            )
          end
          attr_reader :diagnostic

          sig do
            params(
              diagnostic:
                XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::OrHash
            ).void
          end
          attr_writer :diagnostic

          sig do
            returns(
              T.nilable(
                XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::HasNextPage::TaggedBoolean
              )
            )
          end
          attr_reader :has_next_page

          sig do
            params(
              has_next_page:
                XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::HasNextPage::OrBoolean
            ).void
          end
          attr_writer :has_next_page

          sig do
            returns(
              T.nilable(
                XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::NextCursor::TaggedSymbol
              )
            )
          end
          attr_reader :next_cursor

          sig do
            params(
              next_cursor:
                XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::NextCursor::OrSymbol
            ).void
          end
          attr_writer :next_cursor

          # No-mode search, user Tweet, user reply, and direct reply reads use automatic
          # coverage. Shape, filters, aliases, and billing stay compatible. Unprefixed
          # cursors remain legacy. Follow next_cursor while has_next_page is true. An empty
          # filtered page can still have has_next_page true.
          sig do
            params(
              diagnostic:
                XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::OrHash,
              has_next_page:
                XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::HasNextPage::OrBoolean,
              next_cursor:
                XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::NextCursor::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Coverage evidence across parallel search strategies.
            diagnostic:,
            has_next_page: nil,
            next_cursor: nil
          )
          end

          sig do
            override.returns(
              {
                diagnostic:
                  XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic,
                has_next_page:
                  XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::HasNextPage::TaggedBoolean,
                next_cursor:
                  XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::NextCursor::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          class Diagnostic < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            # True when every strategy exhausted its source.
            sig { returns(T::Boolean) }
            attr_accessor :complete

            sig { returns(Integer) }
            attr_accessor :cursor_failure_count

            sig { returns(T::Boolean) }
            attr_accessor :deadline_reached

            sig { returns(Integer) }
            attr_accessor :duplicate_count

            sig { returns(Integer) }
            attr_accessor :failed_strategy_count

            sig { returns(Integer) }
            attr_accessor :malformed_count

            sig { returns(Integer) }
            attr_accessor :pages_fetched

            # Whether bounded time windows ran in parallel.
            sig { returns(T::Boolean) }
            attr_accessor :partitioned

            # Whether credits or the requested limit reduced output.
            sig { returns(T::Boolean) }
            attr_accessor :response_truncated

            sig { returns(T::Boolean) }
            attr_accessor :result_limit_reached

            sig { returns(Integer) }
            attr_accessor :returned_tweets

            sig { returns(Integer) }
            attr_accessor :stalled_strategy_count

            sig do
              returns(
                T::Array[
                  XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy
                ]
              )
            end
            attr_accessor :strategies

            sig { returns(Integer) }
            attr_accessor :strategy_count

            sig { returns(Integer) }
            attr_accessor :unique_tweets

            # Coverage evidence across parallel search strategies.
            sig do
              params(
                complete: T::Boolean,
                cursor_failure_count: Integer,
                deadline_reached: T::Boolean,
                duplicate_count: Integer,
                failed_strategy_count: Integer,
                malformed_count: Integer,
                pages_fetched: Integer,
                partitioned: T::Boolean,
                response_truncated: T::Boolean,
                result_limit_reached: T::Boolean,
                returned_tweets: Integer,
                stalled_strategy_count: Integer,
                strategies:
                  T::Array[
                    XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::OrHash
                  ],
                strategy_count: Integer,
                unique_tweets: Integer
              ).returns(T.attached_class)
            end
            def self.new(
              # True when every strategy exhausted its source.
              complete:,
              cursor_failure_count:,
              deadline_reached:,
              duplicate_count:,
              failed_strategy_count:,
              malformed_count:,
              pages_fetched:,
              # Whether bounded time windows ran in parallel.
              partitioned:,
              # Whether credits or the requested limit reduced output.
              response_truncated:,
              result_limit_reached:,
              returned_tweets:,
              stalled_strategy_count:,
              strategies:,
              strategy_count:,
              unique_tweets:
            )
            end

            sig do
              override.returns(
                {
                  complete: T::Boolean,
                  cursor_failure_count: Integer,
                  deadline_reached: T::Boolean,
                  duplicate_count: Integer,
                  failed_strategy_count: Integer,
                  malformed_count: Integer,
                  pages_fetched: Integer,
                  partitioned: T::Boolean,
                  response_truncated: T::Boolean,
                  result_limit_reached: T::Boolean,
                  returned_tweets: Integer,
                  stalled_strategy_count: Integer,
                  strategies:
                    T::Array[
                      XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy
                    ],
                  strategy_count: Integer,
                  unique_tweets: Integer
                }
              )
            end
            def to_hash
            end

            class Strategy < XTwitterScraper::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy,
                    XTwitterScraper::Internal::AnyHash
                  )
                end

              sig { returns(Integer) }
              attr_accessor :duplicate_count

              sig { returns(Integer) }
              attr_accessor :pages_fetched

              sig do
                returns(
                  XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::QueryType::TaggedSymbol
                )
              end
              attr_accessor :query_type

              sig do
                returns(
                  XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::StopReason::TaggedSymbol
                )
              end
              attr_accessor :stop_reason

              sig { returns(Integer) }
              attr_accessor :strategy

              sig { returns(Integer) }
              attr_accessor :unique_added

              # Non-overlapping time partition used by one strategy.
              sig do
                returns(
                  T.nilable(
                    XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::Window
                  )
                )
              end
              attr_reader :window

              sig do
                params(
                  window:
                    XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::Window::OrHash
                ).void
              end
              attr_writer :window

              sig do
                params(
                  duplicate_count: Integer,
                  pages_fetched: Integer,
                  query_type:
                    XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::QueryType::OrSymbol,
                  stop_reason:
                    XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::StopReason::OrSymbol,
                  strategy: Integer,
                  unique_added: Integer,
                  window:
                    XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::Window::OrHash
                ).returns(T.attached_class)
              end
              def self.new(
                duplicate_count:,
                pages_fetched:,
                query_type:,
                stop_reason:,
                strategy:,
                unique_added:,
                # Non-overlapping time partition used by one strategy.
                window: nil
              )
              end

              sig do
                override.returns(
                  {
                    duplicate_count: Integer,
                    pages_fetched: Integer,
                    query_type:
                      XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::QueryType::TaggedSymbol,
                    stop_reason:
                      XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::StopReason::TaggedSymbol,
                    strategy: Integer,
                    unique_added: Integer,
                    window:
                      XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::Window
                  }
                )
              end
              def to_hash
              end

              module QueryType
                extend XTwitterScraper::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::QueryType
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                LATEST =
                  T.let(
                    :Latest,
                    XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::QueryType::TaggedSymbol
                  )
                TOP =
                  T.let(
                    :Top,
                    XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::QueryType::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::QueryType::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              module StopReason
                extend XTwitterScraper::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::StopReason
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                CURSOR_FAILURE =
                  T.let(
                    :cursor_failure,
                    XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::StopReason::TaggedSymbol
                  )
                DEADLINE =
                  T.let(
                    :deadline,
                    XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::StopReason::TaggedSymbol
                  )
                EXHAUSTED =
                  T.let(
                    :exhausted,
                    XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::StopReason::TaggedSymbol
                  )
                FAILED =
                  T.let(
                    :failed,
                    XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::StopReason::TaggedSymbol
                  )
                PAGE_LIMIT =
                  T.let(
                    :page_limit,
                    XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::StopReason::TaggedSymbol
                  )
                RESULT_LIMIT =
                  T.let(
                    :result_limit,
                    XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::StopReason::TaggedSymbol
                  )
                STALLED =
                  T.let(
                    :stalled,
                    XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::StopReason::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::StopReason::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              class Window < XTwitterScraper::Internal::Type::BaseModel
                OrHash =
                  T.type_alias do
                    T.any(
                      XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::Diagnostic::Strategy::Window,
                      XTwitterScraper::Internal::AnyHash
                    )
                  end

                sig { returns(Time) }
                attr_accessor :since_time

                sig { returns(Time) }
                attr_accessor :until_time

                # Non-overlapping time partition used by one strategy.
                sig do
                  params(since_time: Time, until_time: Time).returns(
                    T.attached_class
                  )
                end
                def self.new(since_time:, until_time:)
                end

                sig { override.returns({ since_time: Time, until_time: Time }) }
                def to_hash
                end
              end
            end
          end

          module HasNextPage
            extend XTwitterScraper::Internal::Type::Enum

            TaggedBoolean =
              T.type_alias do
                T.all(
                  T::Boolean,
                  XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::HasNextPage
                )
              end
            OrBoolean = T.type_alias { T::Boolean }

            FALSE =
              T.let(
                false,
                XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::HasNextPage::TaggedBoolean
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::HasNextPage::TaggedBoolean
                ]
              )
            end
            def self.values
            end
          end

          module NextCursor
            extend XTwitterScraper::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::NextCursor
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            EMPTY =
              T.let(
                :"",
                XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::NextCursor::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Models::X::TweetSearchResponse::TweetSearchCoverageResponse::NextCursor::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(
            T::Array[XTwitterScraper::Models::X::TweetSearchResponse::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
