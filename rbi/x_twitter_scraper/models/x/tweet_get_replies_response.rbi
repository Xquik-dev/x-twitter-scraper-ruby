# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetGetRepliesResponse < XTwitterScraper::Models::PaginatedTweets
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::TweetGetRepliesResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Evidence for direct-reply coverage and collector behavior.
        sig do
          returns(
            T.nilable(
              XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic
            )
          )
        end
        attr_reader :diagnostic

        sig do
          params(
            diagnostic:
              XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::OrHash
          ).void
        end
        attr_writer :diagnostic

        # Nested replies. Excluded from direct coverage.
        sig { returns(T.nilable(T::Array[XTwitterScraper::SearchTweet])) }
        attr_reader :nested_replies

        sig do
          params(
            nested_replies: T::Array[XTwitterScraper::SearchTweet::OrHash]
          ).void
        end
        attr_writer :nested_replies

        # Direct reply rows. No-mode requests use resumable automatic coverage. Complete
        # mode also returns nested replies and coverage diagnostics. Keep nested replies
        # separate from direct coverage.
        sig do
          params(
            diagnostic:
              XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::OrHash,
            nested_replies: T::Array[XTwitterScraper::SearchTweet::OrHash]
          ).returns(T.attached_class)
        end
        def self.new(
          # Evidence for direct-reply coverage and collector behavior.
          diagnostic: nil,
          # Nested replies. Excluded from direct coverage.
          nested_replies: nil
        )
        end

        sig do
          override.returns(
            {
              diagnostic:
                XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic,
              nested_replies: T::Array[XTwitterScraper::SearchTweet]
            }
          )
        end
        def to_hash
        end

        class Diagnostic < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # Whether coverage met the target without truncation.
          sig { returns(T::Boolean) }
          attr_accessor :complete

          # Unique direct replies as a percentage of the reported count.
          sig { returns(Float) }
          attr_accessor :coverage_percentage

          # Cursor requests that failed.
          sig { returns(Integer) }
          attr_accessor :cursor_failures

          # Duplicate tweet IDs removed across pages and strategies.
          sig { returns(Integer) }
          attr_accessor :duplicate_count

          # Empty pages rejected because they did not make progress.
          sig { returns(Integer) }
          attr_accessor :empty_false_progress_pages

          # Malformed response items rejected.
          sig { returns(Integer) }
          attr_accessor :malformed_count

          # Expected response modules or fields missing from X.
          sig { returns(T::Array[String]) }
          attr_accessor :missing_response_modules_or_fields

          # Unique nested replies kept outside direct coverage.
          sig { returns(Integer) }
          attr_accessor :nested_reply_count

          # Total pages attempted across all strategies.
          sig { returns(Integer) }
          attr_accessor :pages_attempted

          # Recommended next action when coverage is incomplete.
          sig { returns(String) }
          attr_accessor :recommended_fallback

          # Repeated cursors rejected to prevent loops.
          sig { returns(Integer) }
          attr_accessor :repeated_cursor_count

          # Reply count reported on the source post.
          sig { returns(Integer) }
          attr_accessor :reported_reply_count

          # Whether the requested row limit truncated safe results.
          sig { returns(T::Boolean) }
          attr_accessor :response_truncated

          # Field-presence counts across the collected direct replies.
          sig do
            returns(
              XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::Richness
            )
          end
          attr_reader :richness

          sig do
            params(
              richness:
                XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::Richness::OrHash
            ).void
          end
          attr_writer :richness

          # Per-strategy pagination and contribution evidence.
          sig do
            returns(
              T::Array[
                XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::StrategiesAttempted
              ]
            )
          end
          attr_accessor :strategies_attempted

          # Minimum direct replies required for the coverage target.
          sig { returns(Integer) }
          attr_accessor :target_direct_replies

          # Unique replies whose parent ID equals the source post ID.
          sig { returns(Integer) }
          attr_accessor :unique_direct_replies

          # Tweets rejected because they belonged elsewhere.
          sig { returns(Integer) }
          attr_accessor :unrelated_count

          # Evidence for direct-reply coverage and collector behavior.
          sig do
            params(
              complete: T::Boolean,
              coverage_percentage: Float,
              cursor_failures: Integer,
              duplicate_count: Integer,
              empty_false_progress_pages: Integer,
              malformed_count: Integer,
              missing_response_modules_or_fields: T::Array[String],
              nested_reply_count: Integer,
              pages_attempted: Integer,
              recommended_fallback: String,
              repeated_cursor_count: Integer,
              reported_reply_count: Integer,
              response_truncated: T::Boolean,
              richness:
                XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::Richness::OrHash,
              strategies_attempted:
                T::Array[
                  XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::StrategiesAttempted::OrHash
                ],
              target_direct_replies: Integer,
              unique_direct_replies: Integer,
              unrelated_count: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Whether coverage met the target without truncation.
            complete:,
            # Unique direct replies as a percentage of the reported count.
            coverage_percentage:,
            # Cursor requests that failed.
            cursor_failures:,
            # Duplicate tweet IDs removed across pages and strategies.
            duplicate_count:,
            # Empty pages rejected because they did not make progress.
            empty_false_progress_pages:,
            # Malformed response items rejected.
            malformed_count:,
            # Expected response modules or fields missing from X.
            missing_response_modules_or_fields:,
            # Unique nested replies kept outside direct coverage.
            nested_reply_count:,
            # Total pages attempted across all strategies.
            pages_attempted:,
            # Recommended next action when coverage is incomplete.
            recommended_fallback:,
            # Repeated cursors rejected to prevent loops.
            repeated_cursor_count:,
            # Reply count reported on the source post.
            reported_reply_count:,
            # Whether the requested row limit truncated safe results.
            response_truncated:,
            # Field-presence counts across the collected direct replies.
            richness:,
            # Per-strategy pagination and contribution evidence.
            strategies_attempted:,
            # Minimum direct replies required for the coverage target.
            target_direct_replies:,
            # Unique replies whose parent ID equals the source post ID.
            unique_direct_replies:,
            # Tweets rejected because they belonged elsewhere.
            unrelated_count:
          )
          end

          sig do
            override.returns(
              {
                complete: T::Boolean,
                coverage_percentage: Float,
                cursor_failures: Integer,
                duplicate_count: Integer,
                empty_false_progress_pages: Integer,
                malformed_count: Integer,
                missing_response_modules_or_fields: T::Array[String],
                nested_reply_count: Integer,
                pages_attempted: Integer,
                recommended_fallback: String,
                repeated_cursor_count: Integer,
                reported_reply_count: Integer,
                response_truncated: T::Boolean,
                richness:
                  XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::Richness,
                strategies_attempted:
                  T::Array[
                    XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::StrategiesAttempted
                  ],
                target_direct_replies: Integer,
                unique_direct_replies: Integer,
                unrelated_count: Integer
              }
            )
          end
          def to_hash
          end

          class Richness < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::Richness,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            # Replies with article content.
            sig { returns(Integer) }
            attr_accessor :article

            # Replies with author details.
            sig { returns(Integer) }
            attr_accessor :author

            # Replies with card metadata.
            sig { returns(Integer) }
            attr_accessor :card

            # Replies with community-note data.
            sig { returns(Integer) }
            attr_accessor :community_note

            # Replies with a creation timestamp.
            sig { returns(Integer) }
            attr_accessor :created_at

            # Replies with engagement counts.
            sig { returns(Integer) }
            attr_accessor :engagement_counts

            # Replies with entity metadata.
            sig { returns(Integer) }
            attr_accessor :entities

            # Replies with a language value.
            sig { returns(Integer) }
            attr_accessor :language

            # Replies with media metadata.
            sig { returns(Integer) }
            attr_accessor :media

            # Replies with quoted or reposted tweet data.
            sig { returns(Integer) }
            attr_accessor :quoted_or_reposted_tweet

            # Replies with text.
            sig { returns(Integer) }
            attr_accessor :text

            # Total unique direct replies evaluated for richness.
            sig { returns(Integer) }
            attr_accessor :total_replies

            # Replies with a canonical URL.
            sig { returns(Integer) }
            attr_accessor :url

            # Field-presence counts across the collected direct replies.
            sig do
              params(
                article: Integer,
                author: Integer,
                card: Integer,
                community_note: Integer,
                created_at: Integer,
                engagement_counts: Integer,
                entities: Integer,
                language: Integer,
                media: Integer,
                quoted_or_reposted_tweet: Integer,
                text: Integer,
                total_replies: Integer,
                url: Integer
              ).returns(T.attached_class)
            end
            def self.new(
              # Replies with article content.
              article:,
              # Replies with author details.
              author:,
              # Replies with card metadata.
              card:,
              # Replies with community-note data.
              community_note:,
              # Replies with a creation timestamp.
              created_at:,
              # Replies with engagement counts.
              engagement_counts:,
              # Replies with entity metadata.
              entities:,
              # Replies with a language value.
              language:,
              # Replies with media metadata.
              media:,
              # Replies with quoted or reposted tweet data.
              quoted_or_reposted_tweet:,
              # Replies with text.
              text:,
              # Total unique direct replies evaluated for richness.
              total_replies:,
              # Replies with a canonical URL.
              url:
            )
            end

            sig do
              override.returns(
                {
                  article: Integer,
                  author: Integer,
                  card: Integer,
                  community_note: Integer,
                  created_at: Integer,
                  engagement_counts: Integer,
                  entities: Integer,
                  language: Integer,
                  media: Integer,
                  quoted_or_reposted_tweet: Integer,
                  text: Integer,
                  total_replies: Integer,
                  url: Integer
                }
              )
            end
            def to_hash
            end
          end

          class StrategiesAttempted < XTwitterScraper::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::StrategiesAttempted,
                  XTwitterScraper::Internal::AnyHash
                )
              end

            sig { returns(String) }
            attr_accessor :name

            sig { returns(Integer) }
            attr_accessor :new_direct_replies

            sig { returns(Integer) }
            attr_accessor :new_nested_replies

            sig { returns(Integer) }
            attr_accessor :pages_attempted

            sig do
              returns(
                XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::StrategiesAttempted::StopReason::TaggedSymbol
              )
            end
            attr_accessor :stop_reason

            sig do
              params(
                name: String,
                new_direct_replies: Integer,
                new_nested_replies: Integer,
                pages_attempted: Integer,
                stop_reason:
                  XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::StrategiesAttempted::StopReason::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              name:,
              new_direct_replies:,
              new_nested_replies:,
              pages_attempted:,
              stop_reason:
            )
            end

            sig do
              override.returns(
                {
                  name: String,
                  new_direct_replies: Integer,
                  new_nested_replies: Integer,
                  pages_attempted: Integer,
                  stop_reason:
                    XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::StrategiesAttempted::StopReason::TaggedSymbol
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
                    XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::StrategiesAttempted::StopReason
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              DEADLINE =
                T.let(
                  :deadline,
                  XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::StrategiesAttempted::StopReason::TaggedSymbol
                )
              EMPTY_PAGES =
                T.let(
                  :empty_pages,
                  XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::StrategiesAttempted::StopReason::TaggedSymbol
                )
              ERROR =
                T.let(
                  :error,
                  XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::StrategiesAttempted::StopReason::TaggedSymbol
                )
              MISSING_CURSOR =
                T.let(
                  :missing_cursor,
                  XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::StrategiesAttempted::StopReason::TaggedSymbol
                )
              NO_NEXT_PAGE =
                T.let(
                  :no_next_page,
                  XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::StrategiesAttempted::StopReason::TaggedSymbol
                )
              PAGE_CAP =
                T.let(
                  :page_cap,
                  XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::StrategiesAttempted::StopReason::TaggedSymbol
                )
              REPEATED_CURSOR =
                T.let(
                  :repeated_cursor,
                  XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::StrategiesAttempted::StopReason::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::StrategiesAttempted::StopReason::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end
      end
    end
  end
end
