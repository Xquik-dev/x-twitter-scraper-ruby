# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    class ShadowbanReport < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute username
      #   Username of the account. Null for a suspended account asked for by ID.
      #
      #   @return [String, nil]
      required :username, String, nil?: true

      # @!attribute user_id
      #   ID of the account. Null for a suspended account asked for by username.
      #
      #   @return [String, nil]
      required :user_id, String, api_name: :userId, nil?: true

      # @!attribute account
      #   Whether the account is active, protected or suspended.
      #
      #   @return [Symbol, XTwitterScraper::Models::ShadowbanReport::Account]
      required :account, enum: -> { XTwitterScraper::Models::ShadowbanReport::Account }

      # @!attribute checked_at
      #   When the check ran.
      #
      #   @return [Time]
      required :checked_at, Time, api_name: :checkedAt

      # @!attribute overall
      #   `suspended` means X suspended the account. `limited` means at least 1 check
      #   failed. `clear` means search & suggestions passed with no fail. `unclear` means
      #   neither of those.
      #
      #   @return [Symbol, XTwitterScraper::Models::ShadowbanReport::Overall]
      required :overall, enum: -> { XTwitterScraper::Models::ShadowbanReport::Overall }

      # @!attribute checks
      #   The 9 checks, each with a verdict, a reason & evidence.
      #
      #   @return [XTwitterScraper::Models::ShadowbanReport::Checks]
      required :checks, -> { XTwitterScraper::Models::ShadowbanReport::Checks }

      # @!method initialize(username:, user_id:, account:, checked_at:, overall:, checks:)
      #   Says whether X limits 1 account in search, search suggestions, reply threads or
      #   its timeline. Each check holds a verdict, its reason & the evidence it read.
      #   Evidence is null for a check that couldn't read the account.
      #
      #   @param username [String, nil] Username of the account. Null for a suspended account asked for by ID.
      #
      #   @param user_id [String, nil] ID of the account. Null for a suspended account asked for by username.
      #
      #   @param account [Symbol, XTwitterScraper::Models::ShadowbanReport::Account] Whether the account is active, protected or suspended.
      #
      #   @param checked_at [Time] When the check ran.
      #
      #   @param overall [Symbol, XTwitterScraper::Models::ShadowbanReport::Overall] `suspended` means X suspended the account. `limited` means at least 1 check failed. `clear` means search & suggestions passed with no fail. `unclear` means neither of those.
      #
      #   @param checks [XTwitterScraper::Models::ShadowbanReport::Checks] The 9 checks, each with a verdict, a reason & evidence.

      # Whether the account is active, protected or suspended.
      module Account
        extend XTwitterScraper::Internal::Type::Enum

        ACTIVE = :active
        PROTECTED = :protected
        SUSPENDED = :suspended

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # `suspended` means X suspended the account. `limited` means at least 1 check
      # failed. `clear` means search & suggestions passed with no fail. `unclear` means
      # neither of those.
      module Overall
        extend XTwitterScraper::Internal::Type::Enum

        CLEAR = :clear
        LIMITED = :limited
        UNCLEAR = :unclear
        SUSPENDED = :suspended

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class Checks < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute account
        #   Passes an active or protected account & fails a suspended one.
        #
        #   @return [XTwitterScraper::Models::ShadowbanReport::Checks::Account]
        required :account, -> { XTwitterScraper::Models::ShadowbanReport::Checks::Account }

        # @!attribute search
        #   Looks for the account's recent posts in X search, sorted by Latest. `listed`
        #   passes & `missing` fails.
        #
        #   @return [XTwitterScraper::Models::ShadowbanReport::Checks::Search]
        required :search, -> { XTwitterScraper::Models::ShadowbanReport::Checks::Search }

        # @!attribute suggestion
        #   Looks for the account among the accounts X suggests for its username.
        #   `suggested` passes & `not_suggested` fails.
        #
        #   @return [XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion]
        required :suggestion, -> { XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion }

        # @!attribute replies
        #   Opens the threads of up to 3 recent replies to other accounts. `in_thread`
        #   passes. X ranks replies for each viewer, so `more_replies` can't tell.
        #
        #   @return [XTwitterScraper::Models::ShadowbanReport::Checks::Replies]
        required :replies, -> { XTwitterScraper::Models::ShadowbanReport::Checks::Replies }

        # @!attribute reply_lock
        #   Reads the same reply threads as `replies`. `replies_show` passes when any
        #   checked reply shows. X ranks replies for each viewer, so `replies_missing` can't
        #   tell.
        #
        #   @return [XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock]
        required :reply_lock, -> { XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock }, api_name: :replyLock

        # @!attribute timeline
        #   Looks for the account's posts on its profile timeline. `visible` passes &
        #   `hidden` fails.
        #
        #   @return [XTwitterScraper::Models::ShadowbanReport::Checks::Timeline]
        required :timeline, -> { XTwitterScraper::Models::ShadowbanReport::Checks::Timeline }

        # @!attribute engagement
        #   Compares the newest 5 of the account's own posts older than 24 hours with its
        #   earlier posts, by the median of likes, replies, reposts & quotes. `typical`
        #   passes at 25% or more. A drop alone proves nothing, so `low` can't tell.
        #
        #   @return [XTwitterScraper::Models::ShadowbanReport::Checks::Engagement]
        required :engagement, -> { XTwitterScraper::Models::ShadowbanReport::Checks::Engagement }

        # @!attribute sensitive
        #   Reads X's sensitive flag on the profile. `not_flagged` passes & `flagged` fails.
        #
        #   @return [XTwitterScraper::Models::ShadowbanReport::Checks::Sensitive]
        required :sensitive, -> { XTwitterScraper::Models::ShadowbanReport::Checks::Sensitive }

        # @!attribute withheld
        #   Reads the countries where X withholds the account. `none` passes & `countries`
        #   fails.
        #
        #   @return [XTwitterScraper::Models::ShadowbanReport::Checks::Withheld]
        required :withheld, -> { XTwitterScraper::Models::ShadowbanReport::Checks::Withheld }

        # @!method initialize(account:, search:, suggestion:, replies:, reply_lock:, timeline:, engagement:, sensitive:, withheld:)
        #   The 9 checks, each with a verdict, a reason & evidence.
        #
        #   @param account [XTwitterScraper::Models::ShadowbanReport::Checks::Account] Passes an active or protected account & fails a suspended one.
        #
        #   @param search [XTwitterScraper::Models::ShadowbanReport::Checks::Search] Looks for the account's recent posts in X search, sorted by Latest. `listed` passes & `missing` fails.
        #
        #   @param suggestion [XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion] Looks for the account among the accounts X suggests for its username. `suggested` passes & `not_suggested` fails.
        #
        #   @param replies [XTwitterScraper::Models::ShadowbanReport::Checks::Replies] Opens the threads of up to 3 recent replies to other accounts. `in_thread` passes. X ranks replies for each viewer, so `more_replies` can't tell.
        #
        #   @param reply_lock [XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock] Reads the same reply threads as `replies`. `replies_show` passes when any checked reply shows. X ranks replies for each viewer, so `replies_missing` can't tell.
        #
        #   @param timeline [XTwitterScraper::Models::ShadowbanReport::Checks::Timeline] Looks for the account's posts on its profile timeline. `visible` passes & `hidden` fails.
        #
        #   @param engagement [XTwitterScraper::Models::ShadowbanReport::Checks::Engagement] Compares the newest 5 of the account's own posts older than 24 hours with its earlier posts, by the median of likes, replies, reposts & quotes. `typical` passes at 25% or more. A drop alone proves nothing, so `low` can't tell.
        #
        #   @param sensitive [XTwitterScraper::Models::ShadowbanReport::Checks::Sensitive] Reads X's sensitive flag on the profile. `not_flagged` passes & `flagged` fails.
        #
        #   @param withheld [XTwitterScraper::Models::ShadowbanReport::Checks::Withheld] Reads the countries where X withholds the account. `none` passes & `countries` fails.

        class Account < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute verdict
          #   Pass means X shows the account there, and fail means it doesn't. Unknown means
          #   the check had nothing to test or X didn't answer.
          #
          #   @return [Symbol, XTwitterScraper::Models::ShadowbanVerdict]
          required :verdict, enum: -> { XTwitterScraper::Models::ShadowbanVerdict }

          # @!attribute reason
          #   State of the account on X.
          #
          #   @return [Symbol, XTwitterScraper::Models::ShadowbanReport::Checks::Account::Reason]
          required :reason, enum: -> { XTwitterScraper::Models::ShadowbanReport::Checks::Account::Reason }

          # @!attribute evidence
          #   Where to see the account on X.
          #
          #   @return [XTwitterScraper::Models::ShadowbanReport::Checks::Account::Evidence]
          required :evidence, -> { XTwitterScraper::Models::ShadowbanReport::Checks::Account::Evidence }

          # @!method initialize(verdict:, reason:, evidence:)
          #   Passes an active or protected account & fails a suspended one.
          #
          #   @param verdict [Symbol, XTwitterScraper::Models::ShadowbanVerdict] Pass means X shows the account there, and fail means it doesn't. Unknown means the check had nothing to test or X didn't answer.
          #
          #   @param reason [Symbol, XTwitterScraper::Models::ShadowbanReport::Checks::Account::Reason] State of the account on X.
          #
          #   @param evidence [XTwitterScraper::Models::ShadowbanReport::Checks::Account::Evidence] Where to see the account on X.

          # State of the account on X.
          module Reason
            extend XTwitterScraper::Internal::Type::Enum

            ACTIVE = :active
            PROTECTED = :protected
            SUSPENDED = :suspended

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          class Evidence < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute profile_url
            #   Profile of the account on X.
            #
            #   @return [String]
            required :profile_url, String, api_name: :profileUrl

            # @!method initialize(profile_url:)
            #   Where to see the account on X.
            #
            #   @param profile_url [String] Profile of the account on X.
          end
        end

        class Search < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute verdict
          #   Pass means X shows the account there, and fail means it doesn't. Unknown means
          #   the check had nothing to test or X didn't answer.
          #
          #   @return [Symbol, XTwitterScraper::Models::ShadowbanVerdict]
          required :verdict, enum: -> { XTwitterScraper::Models::ShadowbanVerdict }

          # @!attribute reason
          #   `listed` means search shows its posts & `missing` means it shows none.
          #   `no_recent_posts` means the account has no recent post to look for.
          #
          #   @return [Symbol, XTwitterScraper::Models::ShadowbanReport::Checks::Search::Reason]
          required :reason, enum: -> { XTwitterScraper::Models::ShadowbanReport::Checks::Search::Reason }

          # @!attribute evidence
          #   The search & the posts it looked for.
          #
          #   @return [XTwitterScraper::Models::ShadowbanReport::Checks::Search::Evidence, nil]
          required :evidence, -> { XTwitterScraper::Models::ShadowbanReport::Checks::Search::Evidence }, nil?: true

          # @!method initialize(verdict:, reason:, evidence:)
          #   Looks for the account's recent posts in X search, sorted by Latest. `listed`
          #   passes & `missing` fails.
          #
          #   @param verdict [Symbol, XTwitterScraper::Models::ShadowbanVerdict] Pass means X shows the account there, and fail means it doesn't. Unknown means the check had nothing to test or X didn't answer.
          #
          #   @param reason [Symbol, XTwitterScraper::Models::ShadowbanReport::Checks::Search::Reason] `listed` means search shows its posts & `missing` means it shows none. `no_recent_posts` means the account has no recent post to look for.
          #
          #   @param evidence [XTwitterScraper::Models::ShadowbanReport::Checks::Search::Evidence, nil] The search & the posts it looked for.

          # `listed` means search shows its posts & `missing` means it shows none.
          # `no_recent_posts` means the account has no recent post to look for.
          module Reason
            extend XTwitterScraper::Internal::Type::Enum

            LISTED = :listed
            MISSING = :missing
            NO_RECENT_POSTS = :no_recent_posts
            UNAVAILABLE = :unavailable
            PROTECTED = :protected
            SUSPENDED = :suspended

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          class Evidence < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute query
            #   The search it ran.
            #
            #   @return [String]
            required :query, String

            # @!attribute search_url
            #   The same search on X, sorted by Latest.
            #
            #   @return [String]
            required :search_url, String, api_name: :searchUrl

            # @!attribute recent_post_ids
            #   Up to 5 recent posts of the account.
            #
            #   @return [Array<String>]
            required :recent_post_ids,
                     XTwitterScraper::Internal::Type::ArrayOf[String],
                     api_name: :recentPostIds

            # @!attribute found_post_ids
            #   Up to 5 posts of the account that search showed.
            #
            #   @return [Array<String>]
            required :found_post_ids,
                     XTwitterScraper::Internal::Type::ArrayOf[String],
                     api_name: :foundPostIds

            # @!method initialize(query:, search_url:, recent_post_ids:, found_post_ids:)
            #   The search & the posts it looked for.
            #
            #   @param query [String] The search it ran.
            #
            #   @param search_url [String] The same search on X, sorted by Latest.
            #
            #   @param recent_post_ids [Array<String>] Up to 5 recent posts of the account.
            #
            #   @param found_post_ids [Array<String>] Up to 5 posts of the account that search showed.
          end
        end

        class Suggestion < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute verdict
          #   Pass means X shows the account there, and fail means it doesn't. Unknown means
          #   the check had nothing to test or X didn't answer.
          #
          #   @return [Symbol, XTwitterScraper::Models::ShadowbanVerdict]
          required :verdict, enum: -> { XTwitterScraper::Models::ShadowbanVerdict }

          # @!attribute reason
          #   `suggested` means X suggests the account for its username.
          #
          #   @return [Symbol, XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion::Reason]
          required :reason, enum: -> { XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion::Reason }

          # @!attribute evidence
          #   The username searched & the accounts X suggested.
          #
          #   @return [XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion::Evidence, nil]
          required :evidence, -> { XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion::Evidence }, nil?: true

          # @!method initialize(verdict:, reason:, evidence:)
          #   Looks for the account among the accounts X suggests for its username.
          #   `suggested` passes & `not_suggested` fails.
          #
          #   @param verdict [Symbol, XTwitterScraper::Models::ShadowbanVerdict] Pass means X shows the account there, and fail means it doesn't. Unknown means the check had nothing to test or X didn't answer.
          #
          #   @param reason [Symbol, XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion::Reason] `suggested` means X suggests the account for its username.
          #
          #   @param evidence [XTwitterScraper::Models::ShadowbanReport::Checks::Suggestion::Evidence, nil] The username searched & the accounts X suggested.

          # `suggested` means X suggests the account for its username.
          module Reason
            extend XTwitterScraper::Internal::Type::Enum

            SUGGESTED = :suggested
            NOT_SUGGESTED = :not_suggested
            UNAVAILABLE = :unavailable
            SUSPENDED = :suspended

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          class Evidence < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute query
            #   The username it typed.
            #
            #   @return [String]
            required :query, String

            # @!attribute suggested_usernames
            #   Up to 10 accounts X suggested, in its order.
            #
            #   @return [Array<String>]
            required :suggested_usernames,
                     XTwitterScraper::Internal::Type::ArrayOf[String],
                     api_name: :suggestedUsernames

            # @!method initialize(query:, suggested_usernames:)
            #   The username searched & the accounts X suggested.
            #
            #   @param query [String] The username it typed.
            #
            #   @param suggested_usernames [Array<String>] Up to 10 accounts X suggested, in its order.
          end
        end

        class Replies < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute verdict
          #   Pass means X shows the account there, and fail means it doesn't. Unknown means
          #   the check had nothing to test or X didn't answer.
          #
          #   @return [Symbol, XTwitterScraper::Models::ShadowbanVerdict]
          required :verdict, enum: -> { XTwitterScraper::Models::ShadowbanVerdict }

          # @!attribute reason
          #   `more_replies` means X put a reply behind its hidden replies prompt. `not_found`
          #   means no reply showed on the pages the check read.
          #
          #   @return [Symbol, XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Reason]
          required :reason, enum: -> { XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Reason }

          # @!attribute evidence
          #   Each reply it opened & where it showed.
          #
          #   @return [XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence, nil]
          required :evidence, -> { XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence }, nil?: true

          # @!method initialize(verdict:, reason:, evidence:)
          #   Opens the threads of up to 3 recent replies to other accounts. `in_thread`
          #   passes. X ranks replies for each viewer, so `more_replies` can't tell.
          #
          #   @param verdict [Symbol, XTwitterScraper::Models::ShadowbanVerdict] Pass means X shows the account there, and fail means it doesn't. Unknown means the check had nothing to test or X didn't answer.
          #
          #   @param reason [Symbol, XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Reason] `more_replies` means X put a reply behind its hidden replies prompt. `not_found` means no reply showed on the pages the check read.
          #
          #   @param evidence [XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence, nil] Each reply it opened & where it showed.

          # `more_replies` means X put a reply behind its hidden replies prompt. `not_found`
          # means no reply showed on the pages the check read.
          module Reason
            extend XTwitterScraper::Internal::Type::Enum

            IN_THREAD = :in_thread
            MORE_REPLIES = :more_replies
            NO_RECENT_REPLIES = :no_recent_replies
            NOT_FOUND = :not_found
            UNAVAILABLE = :unavailable
            PROTECTED = :protected
            SUSPENDED = :suspended

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          class Evidence < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute replies
            #   Up to 3 replies, newest first.
            #
            #   @return [Array<XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence::Reply>]
            required :replies, -> { XTwitterScraper::Internal::Type::ArrayOf[XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence::Reply] }

            # @!method initialize(replies:)
            #   Each reply it opened & where it showed.
            #
            #   @param replies [Array<XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence::Reply>] Up to 3 replies, newest first.

            class Reply < XTwitterScraper::Internal::Type::BaseModel
              # @!attribute reply_id
              #   ID of the reply.
              #
              #   @return [String]
              required :reply_id, String, api_name: :replyId

              # @!attribute reply_url
              #   The reply on X.
              #
              #   @return [String]
              required :reply_url, String, api_name: :replyUrl

              # @!attribute parent_id
              #   ID of the post it replies to.
              #
              #   @return [String]
              required :parent_id, String, api_name: :parentId

              # @!attribute parent_url
              #   The thread of that post on X.
              #
              #   @return [String]
              required :parent_url, String, api_name: :parentUrl

              # @!attribute placement
              #   `thread` means the reply shows in the thread. `more_replies` means it shows only
              #   behind X's hidden replies prompt.
              #
              #   @return [Symbol, XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence::Reply::Placement]
              required :placement, enum: -> { XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence::Reply::Placement }

              # @!method initialize(reply_id:, reply_url:, parent_id:, parent_url:, placement:)
              #   @param reply_id [String] ID of the reply.
              #
              #   @param reply_url [String] The reply on X.
              #
              #   @param parent_id [String] ID of the post it replies to.
              #
              #   @param parent_url [String] The thread of that post on X.
              #
              #   @param placement [Symbol, XTwitterScraper::Models::ShadowbanReport::Checks::Replies::Evidence::Reply::Placement] `thread` means the reply shows in the thread. `more_replies` means it shows only behind X's hidden replies prompt.

              # `thread` means the reply shows in the thread. `more_replies` means it shows only
              # behind X's hidden replies prompt.
              module Placement
                extend XTwitterScraper::Internal::Type::Enum

                THREAD = :thread
                MORE_REPLIES = :more_replies
                NOT_FOUND = :not_found

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end
          end
        end

        class ReplyLock < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute verdict
          #   Pass means X shows the account there, and fail means it doesn't. Unknown means
          #   the check had nothing to test or X didn't answer.
          #
          #   @return [Symbol, XTwitterScraper::Models::ShadowbanVerdict]
          required :verdict, enum: -> { XTwitterScraper::Models::ShadowbanVerdict }

          # @!attribute reason
          #   `replies_show` means X showed at least 1 checked reply. `replies_missing` means
          #   it showed none on the pages read.
          #
          #   @return [Symbol, XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::Reason]
          required :reason, enum: -> { XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::Reason }

          # @!attribute evidence
          #   How many replies it opened & how many showed.
          #
          #   @return [XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::Evidence, nil]
          required :evidence, -> { XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::Evidence }, nil?: true

          # @!method initialize(verdict:, reason:, evidence:)
          #   Reads the same reply threads as `replies`. `replies_show` passes when any
          #   checked reply shows. X ranks replies for each viewer, so `replies_missing` can't
          #   tell.
          #
          #   @param verdict [Symbol, XTwitterScraper::Models::ShadowbanVerdict] Pass means X shows the account there, and fail means it doesn't. Unknown means the check had nothing to test or X didn't answer.
          #
          #   @param reason [Symbol, XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::Reason] `replies_show` means X showed at least 1 checked reply. `replies_missing` means it showed none on the pages read.
          #
          #   @param evidence [XTwitterScraper::Models::ShadowbanReport::Checks::ReplyLock::Evidence, nil] How many replies it opened & how many showed.

          # `replies_show` means X showed at least 1 checked reply. `replies_missing` means
          # it showed none on the pages read.
          module Reason
            extend XTwitterScraper::Internal::Type::Enum

            REPLIES_SHOW = :replies_show
            REPLIES_MISSING = :replies_missing
            NO_RECENT_REPLIES = :no_recent_replies
            UNAVAILABLE = :unavailable
            PROTECTED = :protected
            SUSPENDED = :suspended

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          class Evidence < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute checked_replies
            #   Replies it looked for, up to 3.
            #
            #   @return [Integer]
            required :checked_replies, Integer, api_name: :checkedReplies

            # @!attribute shown_replies
            #   Replies that showed in their thread.
            #
            #   @return [Integer]
            required :shown_replies, Integer, api_name: :shownReplies

            # @!method initialize(checked_replies:, shown_replies:)
            #   How many replies it opened & how many showed.
            #
            #   @param checked_replies [Integer] Replies it looked for, up to 3.
            #
            #   @param shown_replies [Integer] Replies that showed in their thread.
          end
        end

        class Timeline < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute verdict
          #   Pass means X shows the account there, and fail means it doesn't. Unknown means
          #   the check had nothing to test or X didn't answer.
          #
          #   @return [Symbol, XTwitterScraper::Models::ShadowbanVerdict]
          required :verdict, enum: -> { XTwitterScraper::Models::ShadowbanVerdict }

          # @!attribute reason
          #   `visible` means the timeline shows posts. `hidden` means X counts posts but
          #   shows none. `no_posts` means the account has none to show.
          #
          #   @return [Symbol, XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::Reason]
          required :reason, enum: -> { XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::Reason }

          # @!attribute evidence
          #   The post count on the profile & the posts read.
          #
          #   @return [XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::Evidence, nil]
          required :evidence, -> { XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::Evidence }, nil?: true

          # @!method initialize(verdict:, reason:, evidence:)
          #   Looks for the account's posts on its profile timeline. `visible` passes &
          #   `hidden` fails.
          #
          #   @param verdict [Symbol, XTwitterScraper::Models::ShadowbanVerdict] Pass means X shows the account there, and fail means it doesn't. Unknown means the check had nothing to test or X didn't answer.
          #
          #   @param reason [Symbol, XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::Reason] `visible` means the timeline shows posts. `hidden` means X counts posts but shows none. `no_posts` means the account has none to show.
          #
          #   @param evidence [XTwitterScraper::Models::ShadowbanReport::Checks::Timeline::Evidence, nil] The post count on the profile & the posts read.

          # `visible` means the timeline shows posts. `hidden` means X counts posts but
          # shows none. `no_posts` means the account has none to show.
          module Reason
            extend XTwitterScraper::Internal::Type::Enum

            VISIBLE = :visible
            HIDDEN = :hidden
            NO_POSTS = :no_posts
            UNAVAILABLE = :unavailable
            PROTECTED = :protected
            SUSPENDED = :suspended

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          class Evidence < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute post_count
            #   Posts X counts on the profile.
            #
            #   @return [Integer, nil]
            required :post_count, Integer, api_name: :postCount, nil?: true

            # @!attribute timeline_posts
            #   Posts the timeline read returned, up to 20.
            #
            #   @return [Integer]
            required :timeline_posts, Integer, api_name: :timelinePosts

            # @!method initialize(post_count:, timeline_posts:)
            #   The post count on the profile & the posts read.
            #
            #   @param post_count [Integer, nil] Posts X counts on the profile.
            #
            #   @param timeline_posts [Integer] Posts the timeline read returned, up to 20.
          end
        end

        class Engagement < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute verdict
          #   Pass means X shows the account there, and fail means it doesn't. Unknown means
          #   the check had nothing to test or X didn't answer.
          #
          #   @return [Symbol, XTwitterScraper::Models::ShadowbanVerdict]
          required :verdict, enum: -> { XTwitterScraper::Models::ShadowbanVerdict }

          # @!attribute reason
          #   `too_few_posts` means fewer than 8 posts to compare, or earlier posts with no
          #   engagement.
          #
          #   @return [Symbol, XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::Reason]
          required :reason, enum: -> { XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::Reason }

          # @!attribute evidence
          #   The 2 medians & how many posts each one covers.
          #
          #   @return [XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::Evidence, nil]
          required :evidence, -> { XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::Evidence }, nil?: true

          # @!method initialize(verdict:, reason:, evidence:)
          #   Compares the newest 5 of the account's own posts older than 24 hours with its
          #   earlier posts, by the median of likes, replies, reposts & quotes. `typical`
          #   passes at 25% or more. A drop alone proves nothing, so `low` can't tell.
          #
          #   @param verdict [Symbol, XTwitterScraper::Models::ShadowbanVerdict] Pass means X shows the account there, and fail means it doesn't. Unknown means the check had nothing to test or X didn't answer.
          #
          #   @param reason [Symbol, XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::Reason] `too_few_posts` means fewer than 8 posts to compare, or earlier posts with no engagement.
          #
          #   @param evidence [XTwitterScraper::Models::ShadowbanReport::Checks::Engagement::Evidence, nil] The 2 medians & how many posts each one covers.

          # `too_few_posts` means fewer than 8 posts to compare, or earlier posts with no
          # engagement.
          module Reason
            extend XTwitterScraper::Internal::Type::Enum

            TYPICAL = :typical
            LOW = :low
            TOO_FEW_POSTS = :too_few_posts
            UNAVAILABLE = :unavailable
            PROTECTED = :protected
            SUSPENDED = :suspended

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          class Evidence < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute newest_median
            #   Median engagement of the newest posts.
            #
            #   @return [Float]
            required :newest_median, Float, api_name: :newestMedian

            # @!attribute newest_posts
            #   Posts in the newest group, up to 5.
            #
            #   @return [Integer]
            required :newest_posts, Integer, api_name: :newestPosts

            # @!attribute earlier_median
            #   Median engagement of the earlier posts.
            #
            #   @return [Float]
            required :earlier_median, Float, api_name: :earlierMedian

            # @!attribute earlier_posts
            #   Posts in the earlier group.
            #
            #   @return [Integer]
            required :earlier_posts, Integer, api_name: :earlierPosts

            # @!method initialize(newest_median:, newest_posts:, earlier_median:, earlier_posts:)
            #   The 2 medians & how many posts each one covers.
            #
            #   @param newest_median [Float] Median engagement of the newest posts.
            #
            #   @param newest_posts [Integer] Posts in the newest group, up to 5.
            #
            #   @param earlier_median [Float] Median engagement of the earlier posts.
            #
            #   @param earlier_posts [Integer] Posts in the earlier group.
          end
        end

        class Sensitive < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute verdict
          #   Pass means X shows the account there, and fail means it doesn't. Unknown means
          #   the check had nothing to test or X didn't answer.
          #
          #   @return [Symbol, XTwitterScraper::Models::ShadowbanVerdict]
          required :verdict, enum: -> { XTwitterScraper::Models::ShadowbanVerdict }

          # @!attribute reason
          #   `unknown` means X left the flag out of the profile.
          #
          #   @return [Symbol, XTwitterScraper::Models::ShadowbanReport::Checks::Sensitive::Reason]
          required :reason, enum: -> { XTwitterScraper::Models::ShadowbanReport::Checks::Sensitive::Reason }

          # @!attribute evidence
          #   Always null, since the reason holds the answer.
          #
          #   @return [Object, nil]
          required :evidence, XTwitterScraper::Internal::Type::Unknown, nil?: true

          # @!method initialize(verdict:, reason:, evidence:)
          #   Reads X's sensitive flag on the profile. `not_flagged` passes & `flagged` fails.
          #
          #   @param verdict [Symbol, XTwitterScraper::Models::ShadowbanVerdict] Pass means X shows the account there, and fail means it doesn't. Unknown means the check had nothing to test or X didn't answer.
          #
          #   @param reason [Symbol, XTwitterScraper::Models::ShadowbanReport::Checks::Sensitive::Reason] `unknown` means X left the flag out of the profile.
          #
          #   @param evidence [Object, nil] Always null, since the reason holds the answer.

          # `unknown` means X left the flag out of the profile.
          module Reason
            extend XTwitterScraper::Internal::Type::Enum

            NOT_FLAGGED = :not_flagged
            FLAGGED = :flagged
            UNKNOWN = :unknown
            SUSPENDED = :suspended

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end

        class Withheld < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute verdict
          #   Pass means X shows the account there, and fail means it doesn't. Unknown means
          #   the check had nothing to test or X didn't answer.
          #
          #   @return [Symbol, XTwitterScraper::Models::ShadowbanVerdict]
          required :verdict, enum: -> { XTwitterScraper::Models::ShadowbanVerdict }

          # @!attribute reason
          #   `countries` means X lists at least 1 country.
          #
          #   @return [Symbol, XTwitterScraper::Models::ShadowbanReport::Checks::Withheld::Reason]
          required :reason, enum: -> { XTwitterScraper::Models::ShadowbanReport::Checks::Withheld::Reason }

          # @!attribute evidence
          #   The countries X lists.
          #
          #   @return [XTwitterScraper::Models::ShadowbanReport::Checks::Withheld::Evidence, nil]
          required :evidence, -> { XTwitterScraper::Models::ShadowbanReport::Checks::Withheld::Evidence }, nil?: true

          # @!method initialize(verdict:, reason:, evidence:)
          #   Reads the countries where X withholds the account. `none` passes & `countries`
          #   fails.
          #
          #   @param verdict [Symbol, XTwitterScraper::Models::ShadowbanVerdict] Pass means X shows the account there, and fail means it doesn't. Unknown means the check had nothing to test or X didn't answer.
          #
          #   @param reason [Symbol, XTwitterScraper::Models::ShadowbanReport::Checks::Withheld::Reason] `countries` means X lists at least 1 country.
          #
          #   @param evidence [XTwitterScraper::Models::ShadowbanReport::Checks::Withheld::Evidence, nil] The countries X lists.

          # `countries` means X lists at least 1 country.
          module Reason
            extend XTwitterScraper::Internal::Type::Enum

            NONE = :none
            COUNTRIES = :countries
            SUSPENDED = :suspended

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          class Evidence < XTwitterScraper::Internal::Type::BaseModel
            # @!attribute countries
            #   Country codes as X gives them.
            #
            #   @return [Array<String>]
            required :countries, XTwitterScraper::Internal::Type::ArrayOf[String]

            # @!method initialize(countries:)
            #   The countries X lists.
            #
            #   @param countries [Array<String>] Country codes as X gives them.
          end
        end
      end
    end
  end
end
