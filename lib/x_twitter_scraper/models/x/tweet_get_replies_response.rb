# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Tweets#get_replies
      class TweetGetRepliesResponse < XTwitterScraper::Models::PaginatedTweets
        # @!attribute diagnostic
        #   Evidence for direct-reply coverage and collector behavior.
        #
        #   @return [XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic, nil]
        optional :diagnostic, -> { XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic }

        # @!attribute nested_replies
        #   Nested replies. Excluded from direct coverage.
        #
        #   @return [Array<XTwitterScraper::Models::SearchTweet>, nil]
        optional :nested_replies, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::SearchTweet] }

        # @!method initialize(diagnostic: nil, nested_replies: nil)
        #   Direct reply rows. No-mode requests use resumable automatic coverage. Complete
        #   mode also returns nested replies and coverage diagnostics. Keep nested replies
        #   separate from direct coverage.
        #
        #   @param diagnostic [XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic] Evidence for direct-reply coverage and collector behavior.
        #
        #   @param nested_replies [Array<XTwitterScraper::Models::SearchTweet>] Nested replies. Excluded from direct coverage.

        class Diagnostic < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute complete
          #   Whether coverage met the target without truncation.
          #
          #   @return [Boolean]
          required :complete, XTwitterScraper::Internal::Type::Boolean

          # @!attribute coverage_percentage
          #   Unique direct replies as a percentage of the reported count.
          #
          #   @return [Float]
          required :coverage_percentage, Float, api_name: :coveragePercentage

          # @!attribute cursor_failures
          #   Cursor requests that failed.
          #
          #   @return [Integer]
          required :cursor_failures, Integer, api_name: :cursorFailures

          # @!attribute duplicate_count
          #   Duplicate tweet IDs removed across pages and strategies.
          #
          #   @return [Integer]
          required :duplicate_count, Integer, api_name: :duplicateCount

          # @!attribute empty_false_progress_pages
          #   Empty pages rejected because they did not make progress.
          #
          #   @return [Integer]
          required :empty_false_progress_pages, Integer, api_name: :emptyFalseProgressPages

          # @!attribute malformed_count
          #   Malformed response items rejected.
          #
          #   @return [Integer]
          required :malformed_count, Integer, api_name: :malformedCount

          # @!attribute missing_response_modules_or_fields
          #   Expected response modules or fields missing from X.
          #
          #   @return [Array<String>]
          required :missing_response_modules_or_fields,
                   XTwitterScraper::Internal::Type::ArrayOf[String],
                   api_name: :missingResponseModulesOrFields

          # @!attribute nested_reply_count
          #   Unique nested replies kept outside direct coverage.
          #
          #   @return [Integer]
          required :nested_reply_count, Integer, api_name: :nestedReplyCount

          # @!attribute pages_attempted
          #   Total pages attempted across all strategies.
          #
          #   @return [Integer]
          required :pages_attempted, Integer, api_name: :pagesAttempted

          # @!attribute recommended_fallback
          #   Recommended next action when coverage is incomplete.
          #
          #   @return [String]
          required :recommended_fallback, String, api_name: :recommendedFallback

          # @!attribute repeated_cursor_count
          #   Repeated cursors rejected to prevent loops.
          #
          #   @return [Integer]
          required :repeated_cursor_count, Integer, api_name: :repeatedCursorCount

          # @!attribute reported_reply_count
          #   Reply count reported on the source post.
          #
          #   @return [Integer]
          required :reported_reply_count, Integer, api_name: :reportedReplyCount

          # @!attribute response_truncated
          #   Whether the requested row limit truncated safe results.
          #
          #   @return [Boolean]
          required :response_truncated, XTwitterScraper::Internal::Type::Boolean, api_name: :responseTruncated

          # @!attribute richness
          #   Field-presence counts across the collected direct replies.
          #
          #   @return [XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::Richness]
          required :richness, -> { XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::Richness }

          # @!attribute strategies_attempted
          #   Per-strategy pagination and contribution evidence.
          #
          #   @return [Array<XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::StrategiesAttempted>]
          required :strategies_attempted,
                   -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::StrategiesAttempted] },
                   api_name: :strategiesAttempted

          # @!attribute target_direct_replies
          #   Minimum direct replies required for the coverage target.
          #
          #   @return [Integer]
          required :target_direct_replies, Integer, api_name: :targetDirectReplies

          # @!attribute unique_direct_replies
          #   Unique replies whose parent ID equals the source post ID.
          #
          #   @return [Integer]
          required :unique_direct_replies, Integer, api_name: :uniqueDirectReplies

          # @!attribute unrelated_count
          #   Tweets rejected because they belonged elsewhere.
          #
          #   @return [Integer]
          required :unrelated_count, Integer, api_name: :unrelatedCount

          # @!method initialize(complete:, coverage_percentage:, cursor_failures:, duplicate_count:, empty_false_progress_pages:, malformed_count:, missing_response_modules_or_fields:, nested_reply_count:, pages_attempted:, recommended_fallback:, repeated_cursor_count:, reported_reply_count:, response_truncated:, richness:, strategies_attempted:, target_direct_replies:, unique_direct_replies:, unrelated_count:)
          #   Evidence for direct-reply coverage and collector behavior.
          #
          #   @param complete [Boolean] Whether coverage met the target without truncation.
          #
          #   @param coverage_percentage [Float] Unique direct replies as a percentage of the reported count.
          #
          #   @param cursor_failures [Integer] Cursor requests that failed.
          #
          #   @param duplicate_count [Integer] Duplicate tweet IDs removed across pages and strategies.
          #
          #   @param empty_false_progress_pages [Integer] Empty pages rejected because they did not make progress.
          #
          #   @param malformed_count [Integer] Malformed response items rejected.
          #
          #   @param missing_response_modules_or_fields [Array<String>] Expected response modules or fields missing from X.
          #
          #   @param nested_reply_count [Integer] Unique nested replies kept outside direct coverage.
          #
          #   @param pages_attempted [Integer] Total pages attempted across all strategies.
          #
          #   @param recommended_fallback [String] Recommended next action when coverage is incomplete.
          #
          #   @param repeated_cursor_count [Integer] Repeated cursors rejected to prevent loops.
          #
          #   @param reported_reply_count [Integer] Reply count reported on the source post.
          #
          #   @param response_truncated [Boolean] Whether the requested row limit truncated safe results.
          #
          #   @param richness [XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::Richness] Field-presence counts across the collected direct replies.
          #
          #   @param strategies_attempted [Array<XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::StrategiesAttempted>] Per-strategy pagination and contribution evidence.
          #
          #   @param target_direct_replies [Integer] Minimum direct replies required for the coverage target.
          #
          #   @param unique_direct_replies [Integer] Unique replies whose parent ID equals the source post ID.
          #
          #   @param unrelated_count [Integer] Tweets rejected because they belonged elsewhere.

          # @see XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic#richness
          class Richness < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute article
            #   Replies with article content.
            #
            #   @return [Integer]
            required :article, Integer

            # @!attribute author
            #   Replies with author details.
            #
            #   @return [Integer]
            required :author, Integer

            # @!attribute card
            #   Replies with card metadata.
            #
            #   @return [Integer]
            required :card, Integer

            # @!attribute community_note
            #   Replies with community-note data.
            #
            #   @return [Integer]
            required :community_note, Integer, api_name: :communityNote

            # @!attribute created_at
            #   Replies with a creation timestamp.
            #
            #   @return [Integer]
            required :created_at, Integer, api_name: :createdAt

            # @!attribute engagement_counts
            #   Replies with engagement counts.
            #
            #   @return [Integer]
            required :engagement_counts, Integer, api_name: :engagementCounts

            # @!attribute entities
            #   Replies with entity metadata.
            #
            #   @return [Integer]
            required :entities, Integer

            # @!attribute language
            #   Replies with a language value.
            #
            #   @return [Integer]
            required :language, Integer

            # @!attribute media
            #   Replies with media metadata.
            #
            #   @return [Integer]
            required :media, Integer

            # @!attribute quoted_or_reposted_tweet
            #   Replies with quoted or reposted tweet data.
            #
            #   @return [Integer]
            required :quoted_or_reposted_tweet, Integer, api_name: :quotedOrRepostedTweet

            # @!attribute text
            #   Replies with text.
            #
            #   @return [Integer]
            required :text, Integer

            # @!attribute total_replies
            #   Total unique direct replies evaluated for richness.
            #
            #   @return [Integer]
            required :total_replies, Integer, api_name: :totalReplies

            # @!attribute url
            #   Replies with a canonical URL.
            #
            #   @return [Integer]
            required :url, Integer

            # @!method initialize(article:, author:, card:, community_note:, created_at:, engagement_counts:, entities:, language:, media:, quoted_or_reposted_tweet:, text:, total_replies:, url:)
            #   Field-presence counts across the collected direct replies.
            #
            #   @param article [Integer] Replies with article content.
            #
            #   @param author [Integer] Replies with author details.
            #
            #   @param card [Integer] Replies with card metadata.
            #
            #   @param community_note [Integer] Replies with community-note data.
            #
            #   @param created_at [Integer] Replies with a creation timestamp.
            #
            #   @param engagement_counts [Integer] Replies with engagement counts.
            #
            #   @param entities [Integer] Replies with entity metadata.
            #
            #   @param language [Integer] Replies with a language value.
            #
            #   @param media [Integer] Replies with media metadata.
            #
            #   @param quoted_or_reposted_tweet [Integer] Replies with quoted or reposted tweet data.
            #
            #   @param text [Integer] Replies with text.
            #
            #   @param total_replies [Integer] Total unique direct replies evaluated for richness.
            #
            #   @param url [Integer] Replies with a canonical URL.
          end

          class StrategiesAttempted < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute name
            #
            #   @return [String]
            required :name, String

            # @!attribute new_direct_replies
            #
            #   @return [Integer]
            required :new_direct_replies, Integer, api_name: :newDirectReplies

            # @!attribute new_nested_replies
            #
            #   @return [Integer]
            required :new_nested_replies, Integer, api_name: :newNestedReplies

            # @!attribute pages_attempted
            #
            #   @return [Integer]
            required :pages_attempted, Integer, api_name: :pagesAttempted

            # @!attribute stop_reason
            #
            #   @return [Symbol, XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::StrategiesAttempted::StopReason]
            required :stop_reason,
                     enum: -> { XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::StrategiesAttempted::StopReason },
                     api_name: :stopReason

            # @!method initialize(name:, new_direct_replies:, new_nested_replies:, pages_attempted:, stop_reason:)
            #   @param name [String]
            #   @param new_direct_replies [Integer]
            #   @param new_nested_replies [Integer]
            #   @param pages_attempted [Integer]
            #   @param stop_reason [Symbol, XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::StrategiesAttempted::StopReason]

            # @see XTwitterScraper::Models::X::TweetGetRepliesResponse::Diagnostic::StrategiesAttempted#stop_reason
            module StopReason
              extend XTwitterScraper::Internal::Type::Enum

              DEADLINE = :deadline
              EMPTY_PAGES = :empty_pages
              ERROR = :error
              MISSING_CURSOR = :missing_cursor
              NO_NEXT_PAGE = :no_next_page
              PAGE_CAP = :page_cap
              REPEATED_CURSOR = :repeated_cursor

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end
      end
    end
  end
end
