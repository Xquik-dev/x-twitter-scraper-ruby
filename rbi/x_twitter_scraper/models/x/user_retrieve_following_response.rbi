# typed: strong

module XTwitterScraper
  module Models
    module X
      # Paginated user profiles. No-mode follower, following, and verified follower
      # requests merge independent views automatically. Response fields, page size,
      # aliases, filters, and per-returned-profile billing stay unchanged. Existing
      # unprefixed cursors retain legacy behavior. Follow next_cursor while
      # has_next_page is true.
      module UserRetrieveFollowingResponse
        extend XTwitterScraper::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              XTwitterScraper::PaginatedUsers,
              XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse
            )
          end

        class UserListCoverageResponse < XTwitterScraper::Models::PaginatedUsers
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Coverage evidence across parallel relationship strategies.
          sig do
            returns(
              XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic
            )
          end
          attr_reader :diagnostic

          sig do
            params(
              diagnostic:
                XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::OrHash
            ).void
          end
          attr_writer :diagnostic

          sig do
            returns(
              T.nilable(
                XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::HasNextPage::TaggedBoolean
              )
            )
          end
          attr_reader :has_next_page

          sig do
            params(
              has_next_page:
                XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::HasNextPage::OrBoolean
            ).void
          end
          attr_writer :has_next_page

          sig do
            returns(
              T.nilable(
                XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::NextCursor::TaggedSymbol
              )
            )
          end
          attr_reader :next_cursor

          sig do
            params(
              next_cursor:
                XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::NextCursor::OrSymbol
            ).void
          end
          attr_writer :next_cursor

          # Paginated user profiles. No-mode follower, following, and verified follower
          # requests merge independent views automatically. Response fields, page size,
          # aliases, filters, and per-returned-profile billing stay unchanged. Existing
          # unprefixed cursors retain legacy behavior. Follow next_cursor while
          # has_next_page is true.
          sig do
            params(
              diagnostic:
                XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::OrHash,
              has_next_page:
                XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::HasNextPage::OrBoolean,
              next_cursor:
                XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::NextCursor::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Coverage evidence across parallel relationship strategies.
            diagnostic:,
            has_next_page: nil,
            next_cursor: nil
          )
          end

          sig do
            override.returns(
              {
                diagnostic:
                  XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic,
                has_next_page:
                  XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::HasNextPage::TaggedBoolean,
                next_cursor:
                  XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::NextCursor::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          class Diagnostic < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic,
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

            # Whether credits or the requested limit reduced output.
            sig { returns(T::Boolean) }
            attr_accessor :response_truncated

            sig { returns(T::Boolean) }
            attr_accessor :result_limit_reached

            sig { returns(Integer) }
            attr_accessor :returned_users

            sig { returns(Integer) }
            attr_accessor :stalled_strategy_count

            sig do
              returns(
                T::Array[
                  XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::Strategy
                ]
              )
            end
            attr_accessor :strategies

            sig { returns(Integer) }
            attr_accessor :strategy_count

            sig { returns(Integer) }
            attr_accessor :unique_users

            # Coverage evidence across parallel relationship strategies.
            sig do
              params(
                complete: T::Boolean,
                cursor_failure_count: Integer,
                deadline_reached: T::Boolean,
                duplicate_count: Integer,
                failed_strategy_count: Integer,
                malformed_count: Integer,
                pages_fetched: Integer,
                response_truncated: T::Boolean,
                result_limit_reached: T::Boolean,
                returned_users: Integer,
                stalled_strategy_count: Integer,
                strategies:
                  T::Array[
                    XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::Strategy::OrHash
                  ],
                strategy_count: Integer,
                unique_users: Integer
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
              # Whether credits or the requested limit reduced output.
              response_truncated:,
              result_limit_reached:,
              returned_users:,
              stalled_strategy_count:,
              strategies:,
              strategy_count:,
              unique_users:
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
                  response_truncated: T::Boolean,
                  result_limit_reached: T::Boolean,
                  returned_users: Integer,
                  stalled_strategy_count: Integer,
                  strategies:
                    T::Array[
                      XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::Strategy
                    ],
                  strategy_count: Integer,
                  unique_users: Integer
                }
              )
            end
            def to_hash
            end

            class Strategy < XTwitterScraper::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::Strategy,
                    XTwitterScraper::Internal::AnyHash
                  )
                end

              sig { returns(Integer) }
              attr_accessor :duplicate_count

              sig { returns(Integer) }
              attr_accessor :pages_fetched

              sig do
                returns(
                  XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::Strategy::StopReason::TaggedSymbol
                )
              end
              attr_accessor :stop_reason

              sig { returns(Integer) }
              attr_accessor :strategy

              sig { returns(Integer) }
              attr_accessor :unique_added

              sig do
                params(
                  duplicate_count: Integer,
                  pages_fetched: Integer,
                  stop_reason:
                    XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::Strategy::StopReason::OrSymbol,
                  strategy: Integer,
                  unique_added: Integer
                ).returns(T.attached_class)
              end
              def self.new(
                duplicate_count:,
                pages_fetched:,
                stop_reason:,
                strategy:,
                unique_added:
              )
              end

              sig do
                override.returns(
                  {
                    duplicate_count: Integer,
                    pages_fetched: Integer,
                    stop_reason:
                      XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::Strategy::StopReason::TaggedSymbol,
                    strategy: Integer,
                    unique_added: Integer
                  }
                )
              end
              def to_hash
              end

              module StopReason
                extend XTwitterScraper::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::Strategy::StopReason
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                CURSOR_FAILURE =
                  T.let(
                    :cursor_failure,
                    XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::Strategy::StopReason::TaggedSymbol
                  )
                DEADLINE =
                  T.let(
                    :deadline,
                    XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::Strategy::StopReason::TaggedSymbol
                  )
                EXHAUSTED =
                  T.let(
                    :exhausted,
                    XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::Strategy::StopReason::TaggedSymbol
                  )
                FAILED =
                  T.let(
                    :failed,
                    XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::Strategy::StopReason::TaggedSymbol
                  )
                PAGE_LIMIT =
                  T.let(
                    :page_limit,
                    XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::Strategy::StopReason::TaggedSymbol
                  )
                RESULT_LIMIT =
                  T.let(
                    :result_limit,
                    XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::Strategy::StopReason::TaggedSymbol
                  )
                STALLED =
                  T.let(
                    :stalled,
                    XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::Strategy::StopReason::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::Diagnostic::Strategy::StopReason::TaggedSymbol
                    ]
                  )
                end
                def self.values
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
                  XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::HasNextPage
                )
              end
            OrBoolean = T.type_alias { T::Boolean }

            FALSE =
              T.let(
                false,
                XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::HasNextPage::TaggedBoolean
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::HasNextPage::TaggedBoolean
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
                  XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::NextCursor
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            EMPTY =
              T.let(
                :"",
                XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::NextCursor::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  XTwitterScraper::Models::X::UserRetrieveFollowingResponse::UserListCoverageResponse::NextCursor::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        sig do
          override.returns(
            T::Array[
              XTwitterScraper::Models::X::UserRetrieveFollowingResponse::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
