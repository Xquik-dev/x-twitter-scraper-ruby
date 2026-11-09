# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Communities
        # X write actions (tweets, likes, follows, DMs)
        sig { returns(XTwitterScraper::Resources::X::Communities::Join) }
        attr_reader :join

        # X Community info, members, and tweets
        sig { returns(XTwitterScraper::Resources::X::Communities::Tweets) }
        attr_reader :tweets

        # Create community
        sig do
          params(
            account: String,
            name: String,
            idempotency_key: String,
            description: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::CommunityCreateResponse)
        end
        def create(
          # Body param: X account (@username or ID) creating the community
          account:,
          # Body param: Community name
          name:,
          # Header param: Generate one unique value for each intended write. Reuse it only
          # when retrying the exact same account, action, target, and payload. A reused key
          # returns the original action. Reusing it with different input returns 409. Replay
          # protection remains active for at least 90 days.
          idempotency_key:,
          # Body param: Community description
          description: nil,
          request_options: {}
        )
        end

        # Delete community
        sig do
          params(
            id: String,
            account: String,
            community_name: String,
            idempotency_key: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::CommunityDeleteResponse)
        end
        def delete(
          # Path param: Resource ID returned by the matching create or list endpoint.
          id,
          # Body param: X account (@username or ID) deleting the community
          account:,
          # Body param: Community name for confirmation
          community_name:,
          # Header param: Generate one unique value for each intended write. Reuse it only
          # when retrying the exact same account, action, target, and payload. A reused key
          # returns the original action. Reusing it with different input returns 409. Replay
          # protection remains active for at least 90 days.
          idempotency_key:,
          request_options: {}
        )
        end

        # Get community name, description & member count
        sig do
          params(
            id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::CommunityRetrieveInfoResponse)
        end
        def retrieve_info(
          # Community ID
          id,
          request_options: {}
        )
        end

        # List members of a community
        sig do
          params(
            id: String,
            bio_contains: String,
            blue_verified_only: T::Boolean,
            business_email_only: T::Boolean,
            cursor: String,
            email_domains: String,
            fields: String,
            has_email: T::Boolean,
            has_location: T::Boolean,
            has_website: T::Boolean,
            location_contains: String,
            max_followers: Integer,
            max_following: Integer,
            max_statuses: Integer,
            min_account_age_days: Integer,
            min_followers: Integer,
            min_following: Integer,
            min_statuses: Integer,
            omit: String,
            page_size: Integer,
            username_contains: String,
            verified_only: T::Boolean,
            verified_type: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedUsers)
        end
        def retrieve_members(
          # Community ID for member lookup
          id,
          # Match any comma-separated or line-separated bio term, ignoring case.
          bio_contains: nil,
          # Only return profiles X marks as blue verified. X marks many business &
          # government accounts blue too. Use verifiedType for 1 badge type.
          blue_verified_only: nil,
          # Only return profiles that publish an email outside free webmail, such as Gmail.
          business_email_only: nil,
          # Pagination cursor
          cursor: nil,
          # Only return profiles with an email at one of these domains. Separate domains
          # with commas. Subdomains match.
          email_domains: nil,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Only return profiles that publish an email.
          has_email: nil,
          # Only return profiles with a location.
          has_location: nil,
          # Only return profiles with a website.
          has_website: nil,
          # Match a location substring, ignoring case.
          location_contains: nil,
          # Maximum follower count. Missing counts pass this maximum.
          max_followers: nil,
          # Maximum following count.
          max_following: nil,
          # Maximum post count. maxPosts is also accepted.
          max_statuses: nil,
          # Minimum account age in whole days.
          min_account_age_days: nil,
          # Minimum follower count. Filtering happens before billing.
          min_followers: nil,
          # Minimum following count.
          min_following: nil,
          # Minimum post count. minPosts is also accepted.
          min_statuses: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          # Items per page (20-200, default 20). This is an upper bound for paid
          # authenticated calls: remaining credits can reduce the returned page size, and
          # zero affordable results returns 402 insufficient_credits.
          page_size: nil,
          # Match a username substring, ignoring case.
          username_contains: nil,
          # Only return verified profiles.
          verified_only: nil,
          # Match the verification type exactly, ignoring case.
          verified_type: nil,
          request_options: {}
        )
        end

        # List moderators of a community
        sig do
          params(
            id: String,
            bio_contains: String,
            blue_verified_only: T::Boolean,
            business_email_only: T::Boolean,
            cursor: String,
            email_domains: String,
            fields: String,
            has_email: T::Boolean,
            has_location: T::Boolean,
            has_website: T::Boolean,
            location_contains: String,
            max_followers: Integer,
            max_following: Integer,
            max_statuses: Integer,
            min_account_age_days: Integer,
            min_followers: Integer,
            min_following: Integer,
            min_statuses: Integer,
            omit: String,
            username_contains: String,
            verified_only: T::Boolean,
            verified_type: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedUsers)
        end
        def retrieve_moderators(
          # Community ID for moderator lookup
          id,
          # Match any comma-separated or line-separated bio term, ignoring case.
          bio_contains: nil,
          # Only return profiles X marks as blue verified. X marks many business &
          # government accounts blue too. Use verifiedType for 1 badge type.
          blue_verified_only: nil,
          # Only return profiles that publish an email outside free webmail, such as Gmail.
          business_email_only: nil,
          # Pagination cursor for community moderators
          cursor: nil,
          # Only return profiles with an email at one of these domains. Separate domains
          # with commas. Subdomains match.
          email_domains: nil,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Only return profiles that publish an email.
          has_email: nil,
          # Only return profiles with a location.
          has_location: nil,
          # Only return profiles with a website.
          has_website: nil,
          # Match a location substring, ignoring case.
          location_contains: nil,
          # Maximum follower count. Missing counts pass this maximum.
          max_followers: nil,
          # Maximum following count.
          max_following: nil,
          # Maximum post count. maxPosts is also accepted.
          max_statuses: nil,
          # Minimum account age in whole days.
          min_account_age_days: nil,
          # Minimum follower count. Filtering happens before billing.
          min_followers: nil,
          # Minimum following count.
          min_following: nil,
          # Minimum post count. minPosts is also accepted.
          min_statuses: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          # Match a username substring, ignoring case.
          username_contains: nil,
          # Only return verified profiles.
          verified_only: nil,
          # Match the verification type exactly, ignoring case.
          verified_type: nil,
          request_options: {}
        )
        end

        # Returns tweets, not community records. Requires a Community ID.
        sig do
          params(
            community_id: String,
            q: String,
            any_words: String,
            blue_verified_only: T::Boolean,
            cashtags: String,
            conversation_id: String,
            cursor: String,
            exact_phrase: String,
            exclude_words: String,
            fields: String,
            from_user: String,
            hashtags: String,
            in_reply_to_tweet_id: String,
            language: String,
            max_faves: Integer,
            max_id: String,
            max_quotes: Integer,
            max_replies: Integer,
            max_retweets: Integer,
            mentioning: String,
            min_bookmarks: Integer,
            min_likes: Integer,
            min_quotes: Integer,
            min_replies: Integer,
            min_retweets: Integer,
            min_views: Integer,
            native_retweets: T::Boolean,
            omit: String,
            page_size: Integer,
            query_type:
              XTwitterScraper::X::CommunityRetrieveSearchParams::QueryType::OrSymbol,
            quotes_of_tweet_id: String,
            retweets_of_tweet_id: String,
            since_date: Date,
            since_id: String,
            to_user: String,
            until_date: Date,
            url: String,
            verified_only: T::Boolean,
            within_time: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedTweets)
        end
        def retrieve_search(
          # Numeric ID of the community whose posts to search
          community_id:,
          # Search query
          q:,
          # Words or quoted phrases where any one can match. Separate with spaces, commas,
          # or lines.
          any_words: nil,
          # Only return tweets from Blue-verified authors.
          blue_verified_only: nil,
          # Cashtags separated by spaces, commas, or lines.
          cashtags: nil,
          # Conversation ID filter.
          conversation_id: nil,
          # Pagination cursor for community search
          cursor: nil,
          # Match this exact phrase, word for word.
          exact_phrase: nil,
          # Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
          exclude_words: nil,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Filter by author username. Account searches include all of the account's posts &
          # reposts.
          from_user: nil,
          # Hashtags separated by spaces, commas, or lines.
          hashtags: nil,
          # Only replies to this tweet ID.
          in_reply_to_tweet_id: nil,
          # Filter by language. Its alias is `lang`. Language filters work for every
          # language X tags.
          language: nil,
          # Maximum likes threshold. maxLikes & max_likes also work.
          max_faves: nil,
          # Return Tweets at or below this ID.
          max_id: nil,
          # Maximum quotes threshold.
          max_quotes: nil,
          # Maximum replies threshold.
          max_replies: nil,
          # Maximum retweets threshold.
          max_retweets: nil,
          # Filter tweets mentioning a username.
          mentioning: nil,
          # Minimum bookmark count threshold.
          min_bookmarks: nil,
          # Minimum likes. Its aliases are minFaves, min_likes & min_faves.
          min_likes: nil,
          # Minimum quote count threshold.
          min_quotes: nil,
          # Minimum replies threshold.
          min_replies: nil,
          # Minimum retweets threshold.
          min_retweets: nil,
          # Minimum view count threshold.
          min_views: nil,
          # Only return native reposts.
          native_retweets: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          # Maximum page items (1-100, default 20). Source, filters, or credits can reduce
          # results. Continue while has_next_page is true. Deprecated limit and count
          # aliases remain accepted.
          page_size: nil,
          # Sort order (Latest or Top)
          query_type: nil,
          # Only quotes of this tweet ID.
          quotes_of_tweet_id: nil,
          # Only retweets of this tweet ID.
          retweets_of_tweet_id: nil,
          # Start date in YYYY-MM-DD format, as a UTC day. A date means one thing in any
          # common form.
          since_date: nil,
          # Return Tweets whose IDs exceed this ID. Searches accept `since_id` & `max_id`
          # bounds.
          since_id: nil,
          # Filter replies sent to a username.
          to_user: nil,
          # End date in YYYY-MM-DD format, as a UTC day, inclusive, so its own posts count.
          until_date: nil,
          # URL substring or domain filter.
          url: nil,
          # Only return tweets from verified authors.
          verified_only: nil,
          # Keeps Tweets from a recent window, such as 90m or 7d. Use a whole number & s, m,
          # h or d.
          within_time: nil,
          request_options: {}
        )
        end

        # @api private
        sig do
          params(client: XTwitterScraper::Client).returns(T.attached_class)
        end
        def self.new(client:)
        end
      end
    end
  end
end
