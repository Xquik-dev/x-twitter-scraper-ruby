# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Users
        # X write actions (tweets, likes, follows, DMs)
        sig { returns(XTwitterScraper::Resources::X::Users::Follow) }
        attr_reader :follow

        sig { returns(XTwitterScraper::Resources::X::Users::Block) }
        attr_reader :block

        sig { returns(XTwitterScraper::Resources::X::Users::Mute) }
        attr_reader :mute

        # Get user profile with follower counts & verification
        sig do
          params(
            id: String,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::UserProfile)
        end
        def retrieve(
          # X username (without @) or user ID
          id,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          request_options: {}
        )
        end

        # Remove follower
        sig do
          params(
            id: String,
            account: String,
            idempotency_key: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::UserRemoveFollowerResponse)
        end
        def remove_follower(
          # Path param: User ID to remove from your followers
          id,
          # Body param: X account identifier (@username or account ID)
          account:,
          # Header param: Generate one unique value for each intended write. Reuse it only
          # when retrying the exact same account, action, target, and payload. A reused key
          # returns the original action. Reusing it with different input returns 409. Replay
          # protection remains active for at least 90 days.
          idempotency_key:,
          request_options: {}
        )
        end

        # Look up multiple users by IDs in one call
        sig do
          params(
            ids: String,
            bio_contains: String,
            blue_verified_only: T::Boolean,
            business_email_only: T::Boolean,
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
            usernames: String,
            verified_only: T::Boolean,
            verified_type: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::UserRetrieveBatchResponse)
        end
        def retrieve_batch(
          # Comma-separated numeric user IDs (1-100 values). Duplicate IDs are ignored while
          # preserving first-seen order.
          ids: nil,
          # Match any comma-separated or line-separated bio term, ignoring case.
          bio_contains: nil,
          # Only return profiles X marks as blue verified. X marks many business &
          # government accounts blue too. Use verifiedType for 1 badge type.
          blue_verified_only: nil,
          # Only return profiles that publish an email outside free webmail, such as Gmail.
          business_email_only: nil,
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
          # Maximum follower count. A profile without a count passes.
          max_followers: nil,
          # Profiles may follow at most this many accounts.
          max_following: nil,
          # Maximum post count. maxPosts is also accepted.
          max_statuses: nil,
          # Minimum account age in whole days.
          min_account_age_days: nil,
          # Minimum follower count. Profiles the filter drops cost nothing.
          min_followers: nil,
          # Profiles must follow at least this many accounts.
          min_following: nil,
          # Minimum post count. minPosts is also accepted.
          min_statuses: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          # Match a username substring, ignoring case.
          username_contains: nil,
          # Comma-separated X usernames, with or without @, or profile links such as
          # x.com/nasa, in place of ids. A name in another case is the same account. A
          # longer URL fails at the edge before Xquik reads it.
          usernames: nil,
          # Only return verified profiles.
          verified_only: nil,
          # Match the verification type exactly, ignoring case.
          verified_type: nil,
          request_options: {}
        )
        end

        # List followers of a user
        sig do
          params(
            id: String,
            after: String,
            bio_contains: String,
            blue_verified_only: T::Boolean,
            business_email_only: T::Boolean,
            cursor: String,
            email_domains: String,
            enrich_profiles: T::Boolean,
            fields: String,
            has_email: T::Boolean,
            has_location: T::Boolean,
            has_website: T::Boolean,
            limit: Integer,
            location_contains: String,
            max_followers: Integer,
            max_following: Integer,
            max_scan: Integer,
            max_statuses: Integer,
            min_account_age_days: Integer,
            min_followers: Integer,
            min_following: Integer,
            min_statuses: Integer,
            mode:
              XTwitterScraper::X::UserRetrieveFollowersParams::Mode::OrSymbol,
            omit: String,
            page_size: Integer,
            username_contains: String,
            verified_only: T::Boolean,
            verified_type: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(
            XTwitterScraper::Models::X::UserRetrieveFollowersResponse::Variants
          )
        end
        def retrieve_followers(
          # Target user ID or username for follower lookup.
          id,
          # Legacy cursor alias. Prefer cursor.
          after: nil,
          # Match any comma-separated or line-separated bio term, ignoring case.
          bio_contains: nil,
          # Only return profiles X marks as blue verified. X marks many business &
          # government accounts blue too. Use verifiedType for 1 badge type.
          blue_verified_only: nil,
          # Only return profiles that publish an email outside free webmail, such as Gmail.
          business_email_only: nil,
          # Cursor from the previous response. Xquik cursors resume automatic coverage.
          # Existing unprefixed cursors keep legacy standard behavior.
          cursor: nil,
          # Only return profiles with an email at one of these domains. Separate domains
          # with commas. Subdomains match.
          email_domains: nil,
          # Add each row's full profile, as GET /x/users/{id} returns it. Pages take several
          # seconds longer.
          enrich_profiles: nil,
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
          # Legacy page-size alias outside explicit coverage mode. Coverage accepts 1-10000.
          # Prefer pageSize.
          limit: nil,
          # Match a location substring, ignoring case.
          location_contains: nil,
          # Maximum follower count. Missing counts pass this maximum.
          max_followers: nil,
          # Maximum following count.
          max_following: nil,
          # Most profiles 1 request reads, kept or dropped by the filters. The request then
          # answers the profiles it kept, the count it dropped & the cursor to read on. Each
          # request of a cursor may send its own value. Without it, a filtered read scans at
          # most 100,000 profiles of the list across all its pages, & the page that reaches
          # them ends the list with `scanLimit`. An unfiltered read has no scan limit.
          # Automatic mode only.
          max_scan: nil,
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
          # Omit mode for resumable maximum coverage. Standard keeps legacy pagination.
          # Coverage returns diagnostics once and rejects cursors.
          mode: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          # Maximum user profiles: automatic 300; standard 200. Sources return fewer
          # profiles. Continue with has_next_page.
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

        # List mutual followers between you and a user
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
        def retrieve_followers_you_know(
          # User ID for followers-you-know lookup
          id,
          # Match any comma-separated or line-separated bio term, ignoring case.
          bio_contains: nil,
          # Only return profiles X marks as blue verified. X marks many business &
          # government accounts blue too. Use verifiedType for 1 badge type.
          blue_verified_only: nil,
          # Only return profiles that publish an email outside free webmail, such as Gmail.
          business_email_only: nil,
          # Pagination cursor for followers-you-know
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
          # Maximum user profiles requested from this page (20-200, default 200). Source,
          # filters, or credits can return fewer profiles. Keep requesting next_cursor while
          # has_next_page is true. Deprecated aliases remain accepted.
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

        # List accounts a user follows
        sig do
          params(
            id: String,
            after: String,
            bio_contains: String,
            blue_verified_only: T::Boolean,
            business_email_only: T::Boolean,
            cursor: String,
            email_domains: String,
            enrich_profiles: T::Boolean,
            fields: String,
            has_email: T::Boolean,
            has_location: T::Boolean,
            has_website: T::Boolean,
            limit: Integer,
            location_contains: String,
            max_followers: Integer,
            max_following: Integer,
            max_scan: Integer,
            max_statuses: Integer,
            min_account_age_days: Integer,
            min_followers: Integer,
            min_following: Integer,
            min_statuses: Integer,
            mode:
              XTwitterScraper::X::UserRetrieveFollowingParams::Mode::OrSymbol,
            omit: String,
            page_size: Integer,
            username_contains: String,
            verified_only: T::Boolean,
            verified_type: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(
            XTwitterScraper::Models::X::UserRetrieveFollowingResponse::Variants
          )
        end
        def retrieve_following(
          # User ID or username for following lookup
          id,
          # Deprecated following cursor alias. Prefer cursor.
          after: nil,
          # Match any comma-separated or line-separated bio term, ignoring case.
          bio_contains: nil,
          # Only return profiles X marks as blue verified. X marks many business &
          # government accounts blue too. Use verifiedType for 1 badge type.
          blue_verified_only: nil,
          # Only return profiles that publish an email outside free webmail, such as Gmail.
          business_email_only: nil,
          # Cursor from the previous response. Xquik cursors resume automatic coverage.
          # Existing unprefixed cursors keep legacy standard behavior.
          cursor: nil,
          # Only return profiles with an email at one of these domains. Separate domains
          # with commas. Subdomains match.
          email_domains: nil,
          # Add each row's full profile, as GET /x/users/{id} returns it. Pages take several
          # seconds longer.
          enrich_profiles: nil,
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
          # Legacy page-size alias outside explicit coverage mode. Coverage accepts 1-10000.
          # Prefer pageSize.
          limit: nil,
          # Match a location substring, ignoring case.
          location_contains: nil,
          # Maximum follower count. Missing counts pass this maximum.
          max_followers: nil,
          # Maximum following count.
          max_following: nil,
          # Most profiles 1 request reads, kept or dropped by the filters. The request then
          # answers the profiles it kept, the count it dropped & the cursor to read on. Each
          # request of a cursor may send its own value. Without it, a filtered read scans at
          # most 100,000 profiles of the list across all its pages, & the page that reaches
          # them ends the list with `scanLimit`. An unfiltered read has no scan limit.
          # Automatic mode only.
          max_scan: nil,
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
          # Omit mode for resumable maximum coverage. Standard keeps legacy pagination.
          # Coverage returns diagnostics once and rejects cursors.
          mode: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          # Maximum user profiles: automatic 300; standard 200. Sources return fewer
          # profiles. Continue with has_next_page.
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

        # List tweets liked by a user
        sig do
          params(
            id: String,
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
            media_type:
              XTwitterScraper::X::UserRetrieveLikesParams::MediaType::OrSymbol,
            mentioning: String,
            min_bookmarks: Integer,
            min_faves: Integer,
            min_likes: Integer,
            min_quotes: Integer,
            min_replies: Integer,
            min_retweets: Integer,
            min_views: Integer,
            native_retweets: T::Boolean,
            omit: String,
            page_size: Integer,
            quotes:
              XTwitterScraper::X::UserRetrieveLikesParams::Quotes::OrSymbol,
            quotes_of_tweet_id: String,
            replies:
              XTwitterScraper::X::UserRetrieveLikesParams::Replies::OrSymbol,
            retweets:
              XTwitterScraper::X::UserRetrieveLikesParams::Retweets::OrSymbol,
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
        def retrieve_likes(
          # User ID or username
          id,
          # Words or quoted phrases where any one can match. Separate with spaces, commas,
          # or lines.
          any_words: nil,
          # Only return tweets from Blue-verified authors.
          blue_verified_only: nil,
          # Cashtags separated by spaces, commas, or lines.
          cashtags: nil,
          # Conversation ID filter.
          conversation_id: nil,
          # Pagination cursor for liked tweets
          cursor: nil,
          # Exact phrase to match.
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
          # Filter by author username.
          from_user: nil,
          # Hashtags separated by spaces, commas, or lines.
          hashtags: nil,
          # Only replies to this tweet ID.
          in_reply_to_tweet_id: nil,
          # Language code filter, e.g. en or tr.
          language: nil,
          # Maximum likes threshold. maxLikes is also accepted.
          max_faves: nil,
          # Return Tweets older than this Tweet ID.
          max_id: nil,
          # Maximum quotes threshold.
          max_quotes: nil,
          # Maximum replies threshold.
          max_replies: nil,
          # Maximum retweets threshold.
          max_retweets: nil,
          # Filter by media type.
          media_type: nil,
          # Filter tweets mentioning a username.
          mentioning: nil,
          # Minimum bookmark count threshold.
          min_bookmarks: nil,
          # Deprecated alias of min_likes, sent as minLikes.
          min_faves: nil,
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
          # Quote mode.
          quotes: nil,
          # Only quotes of this tweet ID.
          quotes_of_tweet_id: nil,
          # Reply mode.
          replies: nil,
          # Retweet mode.
          retweets: nil,
          # Only retweets of this tweet ID.
          retweets_of_tweet_id: nil,
          # Start date in YYYY-MM-DD format.
          since_date: nil,
          # Return Tweets newer than this Tweet ID.
          since_id: nil,
          # Filter replies sent to a username.
          to_user: nil,
          # End date in YYYY-MM-DD format.
          until_date: nil,
          # URL substring or domain filter.
          url: nil,
          # Only return tweets from verified authors.
          verified_only: nil,
          # Match Tweets inside a recent time window.
          within_time: nil,
          request_options: {}
        )
        end

        # List media tweets posted by a user
        sig do
          params(
            id: String,
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
            image_shows: String,
            in_reply_to_tweet_id: String,
            language: String,
            max_faves: Integer,
            max_id: String,
            max_quotes: Integer,
            max_replies: Integer,
            max_retweets: Integer,
            media_type:
              XTwitterScraper::X::UserRetrieveMediaParams::MediaType::OrSymbol,
            mentioning: String,
            min_bookmarks: Integer,
            min_faves: Integer,
            min_likes: Integer,
            min_quotes: Integer,
            min_replies: Integer,
            min_retweets: Integer,
            min_views: Integer,
            native_retweets: T::Boolean,
            omit: String,
            page_size: Integer,
            quotes:
              XTwitterScraper::X::UserRetrieveMediaParams::Quotes::OrSymbol,
            quotes_of_tweet_id: String,
            replies:
              XTwitterScraper::X::UserRetrieveMediaParams::Replies::OrSymbol,
            retweets:
              XTwitterScraper::X::UserRetrieveMediaParams::Retweets::OrSymbol,
            retweets_of_tweet_id: String,
            since_date: Date,
            since_id: String,
            to_user: String,
            topic: String,
            until_date: Date,
            url: String,
            verified_only: T::Boolean,
            within_time: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(
            XTwitterScraper::Models::X::UserRetrieveMediaResponse::Variants
          )
        end
        def retrieve_media(
          # User ID or username for media lookup
          id,
          # Words or quoted phrases where any one can match. Separate with spaces, commas,
          # or lines.
          any_words: nil,
          # Only return tweets from Blue-verified authors.
          blue_verified_only: nil,
          # Cashtags separated by spaces, commas, or lines.
          cashtags: nil,
          # Conversation ID filter.
          conversation_id: nil,
          # Pagination cursor for media tweets
          cursor: nil,
          # Exact phrase to match.
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
          # Filter by author username.
          from_user: nil,
          # Hashtags separated by spaces, commas, or lines.
          hashtags: nil,
          # Keep only posts whose photos show this. Send charts, screenshots,
          # product_photos, memes or people, or describe it in words, such as a rocket.
          # AI-powered analysis checks posts with photos X doesn't mark sensitive & keeps
          # scores of 0.5 or more. Other posts stay out at no charge. Each kept post costs 2
          # credits, the AI analysis price, instead of the read price, & a post the filter
          # drops costs nothing. imageFilter states the cutoff & counts.
          image_shows: nil,
          # Only replies to this tweet ID.
          in_reply_to_tweet_id: nil,
          # Language code filter, e.g. en or tr.
          language: nil,
          # Maximum likes threshold. maxLikes is also accepted.
          max_faves: nil,
          # Return Tweets older than this Tweet ID.
          max_id: nil,
          # Maximum quotes threshold.
          max_quotes: nil,
          # Maximum replies threshold.
          max_replies: nil,
          # Maximum retweets threshold.
          max_retweets: nil,
          # Filter by media type.
          media_type: nil,
          # Filter tweets mentioning a username.
          mentioning: nil,
          # Minimum bookmark count threshold.
          min_bookmarks: nil,
          # Deprecated alias of min_likes, sent as minLikes.
          min_faves: nil,
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
          # Quote mode.
          quotes: nil,
          # Only quotes of this tweet ID.
          quotes_of_tweet_id: nil,
          # Reply mode.
          replies: nil,
          # Retweet mode.
          retweets: nil,
          # Only retweets of this tweet ID.
          retweets_of_tweet_id: nil,
          # Start date in YYYY-MM-DD format.
          since_date: nil,
          # Return Tweets newer than this Tweet ID.
          since_id: nil,
          # Filter replies sent to a username.
          to_user: nil,
          # Keep only posts about this topic. AI-powered analysis asks "Is this post about
          # <topic>?" of each post & keeps scores of 0.5 or more. It reads post text & safe
          # photos. Each kept post costs 2 credits, the AI analysis price, instead of the
          # read price, & a post the filter drops costs nothing. limit counts checked posts,
          # & only kept posts come back. topicFilter states the cutoff & counts.
          topic: nil,
          # End date in YYYY-MM-DD format.
          until_date: nil,
          # URL substring or domain filter.
          url: nil,
          # Only return tweets from verified authors.
          verified_only: nil,
          # Match Tweets inside a recent time window.
          within_time: nil,
          request_options: {}
        )
        end

        # List tweets mentioning a user
        sig do
          params(
            id: String,
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
            media_type:
              XTwitterScraper::X::UserRetrieveMentionsParams::MediaType::OrSymbol,
            mentioning: String,
            min_bookmarks: Integer,
            min_faves: Integer,
            min_likes: Integer,
            min_quotes: Integer,
            min_replies: Integer,
            min_retweets: Integer,
            min_views: Integer,
            native_retweets: T::Boolean,
            omit: String,
            own_threads: String,
            page_size: Integer,
            quotes:
              XTwitterScraper::X::UserRetrieveMentionsParams::Quotes::OrSymbol,
            quotes_of_tweet_id: String,
            replies:
              XTwitterScraper::X::UserRetrieveMentionsParams::Replies::OrSymbol,
            retweets:
              XTwitterScraper::X::UserRetrieveMentionsParams::Retweets::OrSymbol,
            retweets_of_tweet_id: String,
            since_date: Date,
            since_id: String,
            since_time: String,
            to_user: String,
            until_date: Date,
            until_time: String,
            url: String,
            verified_only: T::Boolean,
            within_time: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedTweets)
        end
        def retrieve_mentions(
          # User ID or username for mentions lookup
          id,
          # Words or quoted phrases where any one can match. Separate with spaces, commas,
          # or lines.
          any_words: nil,
          # Only return tweets from Blue-verified authors.
          blue_verified_only: nil,
          # Cashtags separated by spaces, commas, or lines.
          cashtags: nil,
          # Conversation ID filter.
          conversation_id: nil,
          # Pagination cursor for mentions
          cursor: nil,
          # Exact phrase to match.
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
          # Filter by author username.
          from_user: nil,
          # Hashtags separated by spaces, commas, or lines.
          hashtags: nil,
          # Only replies to this tweet ID.
          in_reply_to_tweet_id: nil,
          # Language code filter, e.g. en or tr.
          language: nil,
          # Maximum likes threshold. maxLikes is also accepted.
          max_faves: nil,
          # Return Tweets older than this Tweet ID.
          max_id: nil,
          # Maximum quotes threshold.
          max_quotes: nil,
          # Maximum replies threshold.
          max_replies: nil,
          # Maximum retweets threshold.
          max_retweets: nil,
          # Filter by media type.
          media_type: nil,
          # Filter tweets mentioning a username.
          mentioning: nil,
          # Minimum bookmark count threshold.
          min_bookmarks: nil,
          # Deprecated alias of min_likes, sent as minLikes.
          min_faves: nil,
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
          # With replies=exclude, also leaves out replies to the author's own posts, so
          # the search skips every reply.
          own_threads: nil,
          # Maximum page items (1-100, default 20). Source, filters, or credits can reduce
          # results. Continue while has_next_page is true. Deprecated limit and count
          # aliases remain accepted.
          page_size: nil,
          # Quote mode.
          quotes: nil,
          # Only quotes of this tweet ID.
          quotes_of_tweet_id: nil,
          # Reply mode.
          replies: nil,
          # Retweet mode.
          retweets: nil,
          # Only retweets of this tweet ID.
          retweets_of_tweet_id: nil,
          # Start date in YYYY-MM-DD format.
          since_date: nil,
          # Return Tweets newer than this Tweet ID.
          since_id: nil,
          # Unix timestamp - return mentions after this time
          since_time: nil,
          # Filter replies sent to a username.
          to_user: nil,
          # End date in YYYY-MM-DD format.
          until_date: nil,
          # Unix timestamp - return mentions before this time
          until_time: nil,
          # URL substring or domain filter.
          url: nil,
          # Only return tweets from verified authors.
          verified_only: nil,
          # Match Tweets inside a recent time window.
          within_time: nil,
          request_options: {}
        )
        end

        # Returns target-authored posts and replies. Omit mode for automatic maximum
        # coverage. Pass next_cursor unchanged. Unprefixed cursors stay legacy. Excludes
        # other-author context.
        sig do
          params(
            id: String,
            advanced_query: String,
            any_words: String,
            blue_verified_only: T::Boolean,
            bounding_box: String,
            card_name: String,
            cashtags: String,
            conversation_id: String,
            cursor: String,
            exact_phrase: String,
            exclude_source: String,
            exclude_words: String,
            fields: String,
            from_user: String,
            geocode: String,
            hashtags: String,
            include_parent_tweet: T::Boolean,
            image_shows: String,
            in_reply_to_tweet_id: String,
            keywords: String,
            language: String,
            list_id: String,
            max_faves: Integer,
            max_id: String,
            max_quotes: Integer,
            max_replies: Integer,
            max_retweets: Integer,
            media_type:
              XTwitterScraper::X::UserRetrieveRepliesParams::MediaType::OrSymbol,
            mentioning: String,
            min_bookmarks: Integer,
            min_faves: Integer,
            min_likes: Integer,
            min_quotes: Integer,
            min_replies: Integer,
            min_retweets: Integer,
            min_views: Integer,
            mode: XTwitterScraper::X::UserRetrieveRepliesParams::Mode::OrSymbol,
            native_retweets: T::Boolean,
            near: String,
            news: T::Boolean,
            omit: String,
            page_size: Integer,
            place: String,
            place_country: String,
            point_radius: String,
            quotes:
              XTwitterScraper::X::UserRetrieveRepliesParams::Quotes::OrSymbol,
            quotes_of_tweet_id: String,
            replies:
              XTwitterScraper::X::UserRetrieveRepliesParams::Replies::OrSymbol,
            retweets:
              XTwitterScraper::X::UserRetrieveRepliesParams::Retweets::OrSymbol,
            retweets_of_tweet_id: String,
            safe: T::Boolean,
            since_date: Date,
            since_id: String,
            since_time: String,
            source: String,
            to_user: String,
            topic: String,
            until_date: Date,
            until_time: String,
            url: String,
            verified_only: T::Boolean,
            within: String,
            within_time: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(
            XTwitterScraper::Models::X::UserRetrieveRepliesResponse::Variants
          )
        end
        def retrieve_replies(
          # Target user ID or username for the replies timeline.
          id,
          # Raw advanced search query appended as-is.
          advanced_query: nil,
          # Words or quoted phrases where any one can match. Separate with spaces, commas,
          # or lines.
          any_words: nil,
          # Only return tweets from Blue-verified authors.
          blue_verified_only: nil,
          # Geo bounding box, such as -74.1 40.6 -73.9 40.8.
          bounding_box: nil,
          # Match the Tweet card name.
          card_name: nil,
          # Cashtags separated by spaces, commas, or lines.
          cashtags: nil,
          # Conversation ID filter.
          conversation_id: nil,
          # Cursor from the previous response. Xquik cursors resume automatic coverage.
          # Existing unprefixed cursors keep legacy standard behavior.
          cursor: nil,
          # Exact phrase to match.
          exact_phrase: nil,
          # Exclude a source application.
          exclude_source: nil,
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
          # Filter by author username.
          from_user: nil,
          # Match latitude, longitude, and radius.
          geocode: nil,
          # Hashtags separated by spaces, commas, or lines.
          hashtags: nil,
          # Include each reply's parent tweet.
          include_parent_tweet: nil,
          # Keep only posts whose photos show this. Send charts, screenshots,
          # product_photos, memes or people, or describe it in words, such as a rocket.
          # AI-powered analysis checks posts with photos X doesn't mark sensitive & keeps
          # scores of 0.5 or more. Other posts stay out at no charge. Each kept post costs 2
          # credits, the AI analysis price, instead of the read price, & a post the filter
          # drops costs nothing. imageFilter states the cutoff & counts.
          image_shows: nil,
          # Only replies to this tweet ID.
          in_reply_to_tweet_id: nil,
          # Words the Tweets must match, in X search syntax.
          keywords: nil,
          # Language code filter, e.g. en or tr.
          language: nil,
          # Search within a list ID.
          list_id: nil,
          # Maximum likes threshold. maxLikes is also accepted.
          max_faves: nil,
          # Return Tweets older than this Tweet ID.
          max_id: nil,
          # Maximum quotes threshold.
          max_quotes: nil,
          # Maximum replies threshold.
          max_replies: nil,
          # Maximum retweets threshold.
          max_retweets: nil,
          # Filter by media type.
          media_type: nil,
          # Filter tweets mentioning a username.
          mentioning: nil,
          # Minimum bookmark count threshold.
          min_bookmarks: nil,
          # Deprecated alias of min_likes, sent as minLikes.
          min_faves: nil,
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
          # Optional legacy pagination override. Filters such as keywords don't apply with
          # it.
          mode: nil,
          # Only return native reposts.
          native_retweets: nil,
          # Match a place name.
          near: nil,
          # Only return news results.
          news: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          # Automatic pages accept 1-300 Tweets. Standard pages keep 1-100. Default 20.
          # Continue while has_next_page is true. Deprecated aliases remain accepted.
          page_size: nil,
          # Search within a place ID.
          place: nil,
          # Search within a country code.
          place_country: nil,
          # Geo point radius, such as -73.99 40.73 25mi.
          point_radius: nil,
          # Quote mode.
          quotes: nil,
          # Only quotes of this tweet ID.
          quotes_of_tweet_id: nil,
          # Reply mode.
          replies: nil,
          # Retweet mode.
          retweets: nil,
          # Only retweets of this tweet ID.
          retweets_of_tweet_id: nil,
          # Enable the safe-search filter.
          safe: nil,
          # Start date in YYYY-MM-DD format.
          since_date: nil,
          # Return Tweets newer than this Tweet ID.
          since_id: nil,
          # Inclusive ISO bound for Tweet creation time, such as 2026-09-25T19:20:41Z. Unix
          # seconds also work. A time without an offset is UTC.
          since_time: nil,
          # Match the source application.
          source: nil,
          # Filter replies sent to a username.
          to_user: nil,
          # Keep only posts about this topic. AI-powered analysis asks "Is this post about
          # <topic>?" of each post & keeps scores of 0.5 or more. It reads post text & safe
          # photos. Each kept post costs 2 credits, the AI analysis price, instead of the
          # read price, & a post the filter drops costs nothing. limit counts checked posts,
          # & only kept posts come back. topicFilter states the cutoff & counts.
          topic: nil,
          # End date in YYYY-MM-DD format.
          until_date: nil,
          # Exclusive ISO bound for Tweet creation time. Unix seconds also work. A time
          # without an offset is UTC.
          until_time: nil,
          # URL substring or domain filter.
          url: nil,
          # Only return tweets from verified authors.
          verified_only: nil,
          # Set the radius for the near filter.
          within: nil,
          # Match Tweets inside a recent time window.
          within_time: nil,
          request_options: {}
        )
        end

        # Search users by name or username
        sig do
          params(
            q: String,
            bio_contains: String,
            blue_verified_only: T::Boolean,
            business_email_only: T::Boolean,
            cursor: String,
            email_domains: String,
            enrich_profiles: T::Boolean,
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
        def retrieve_search(
          # User search query
          q:,
          # Match any comma-separated or line-separated bio term, ignoring case.
          bio_contains: nil,
          # Only return profiles X marks as blue verified. X marks many business &
          # government accounts blue too. Use verifiedType for 1 badge type.
          blue_verified_only: nil,
          # Only return profiles that publish an email outside free webmail, such as Gmail.
          business_email_only: nil,
          # Pagination cursor for user search
          cursor: nil,
          # Only return profiles with an email at one of these domains. Separate domains
          # with commas. Subdomains match.
          email_domains: nil,
          # Add each row's full profile, as GET /x/users/{id} returns it. Pages take several
          # seconds longer.
          enrich_profiles: nil,
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
          # Items per page (1-100, default 20). Source, filters or credits can return fewer.
          # Follow next_cursor for more pages. Its aliases are limit, count, max_results,
          # maxItems, max_items & per_page.
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

        # Omit mode for automatic maximum coverage. Pass next_cursor unchanged. Unprefixed
        # cursors use legacy pagination. Shape and billing stay the same.
        sig do
          params(
            id: String,
            advanced_query: String,
            any_words: String,
            blue_verified_only: T::Boolean,
            bounding_box: String,
            card_name: String,
            cashtags: String,
            conversation_id: String,
            cursor: String,
            exact_phrase: String,
            exclude_source: String,
            exclude_words: String,
            fields: String,
            from_user: String,
            geocode: String,
            hashtags: String,
            include_parent_tweet: T::Boolean,
            include_replies: T::Boolean,
            image_shows: String,
            in_reply_to_tweet_id: String,
            keywords: String,
            language: String,
            list_id: String,
            max_faves: Integer,
            max_id: String,
            max_quotes: Integer,
            max_replies: Integer,
            max_retweets: Integer,
            media_type:
              XTwitterScraper::X::UserRetrieveTweetsParams::MediaType::OrSymbol,
            mentioning: String,
            min_bookmarks: Integer,
            min_faves: Integer,
            min_likes: Integer,
            min_quotes: Integer,
            min_replies: Integer,
            min_retweets: Integer,
            min_views: Integer,
            mode: XTwitterScraper::X::UserRetrieveTweetsParams::Mode::OrSymbol,
            native_retweets: T::Boolean,
            near: String,
            news: T::Boolean,
            omit: String,
            page_size: Integer,
            place: String,
            place_country: String,
            point_radius: String,
            quotes:
              XTwitterScraper::X::UserRetrieveTweetsParams::Quotes::OrSymbol,
            quotes_of_tweet_id: String,
            replies:
              XTwitterScraper::X::UserRetrieveTweetsParams::Replies::OrSymbol,
            retweets:
              XTwitterScraper::X::UserRetrieveTweetsParams::Retweets::OrSymbol,
            retweets_of_tweet_id: String,
            safe: T::Boolean,
            since_date: Date,
            since_id: String,
            since_time: String,
            source: String,
            to_user: String,
            topic: String,
            until_date: Date,
            until_time: String,
            url: String,
            verified_only: T::Boolean,
            within: String,
            within_time: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(
            XTwitterScraper::Models::X::UserRetrieveTweetsResponse::Variants
          )
        end
        def retrieve_tweets(
          # X user ID or username
          id,
          # Raw advanced search query appended as-is.
          advanced_query: nil,
          # Words or quoted phrases where any one can match. Separate with spaces, commas,
          # or lines.
          any_words: nil,
          # Only return tweets from Blue-verified authors.
          blue_verified_only: nil,
          # Geo bounding box, such as -74.1 40.6 -73.9 40.8.
          bounding_box: nil,
          # Match the Tweet card name.
          card_name: nil,
          # Cashtags separated by spaces, commas, or lines.
          cashtags: nil,
          # Conversation ID filter.
          conversation_id: nil,
          # Cursor from the previous response. Xquik cursors resume automatic coverage.
          # Existing unprefixed cursors keep legacy standard behavior.
          cursor: nil,
          # Exact phrase to match.
          exact_phrase: nil,
          # Exclude a source application.
          exclude_source: nil,
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
          # Filter by author username.
          from_user: nil,
          # Match latitude, longitude, and radius.
          geocode: nil,
          # Hashtags separated by spaces, commas, or lines.
          hashtags: nil,
          # Include parent tweet for replies
          include_parent_tweet: nil,
          # Include reply tweets
          include_replies: nil,
          # Keep only posts whose photos show this. Send charts, screenshots,
          # product_photos, memes or people, or describe it in words, such as a rocket.
          # AI-powered analysis checks posts with photos X doesn't mark sensitive & keeps
          # scores of 0.5 or more. Other posts stay out at no charge. Each kept post costs 2
          # credits, the AI analysis price, instead of the read price, & a post the filter
          # drops costs nothing. imageFilter states the cutoff & counts.
          image_shows: nil,
          # Only replies to this tweet ID.
          in_reply_to_tweet_id: nil,
          # Words the Tweets must match, in X search syntax.
          keywords: nil,
          # Language code filter, e.g. en or tr.
          language: nil,
          # Search within a list ID.
          list_id: nil,
          # Maximum likes threshold. maxLikes is also accepted.
          max_faves: nil,
          # Return Tweets older than this Tweet ID.
          max_id: nil,
          # Maximum quotes threshold.
          max_quotes: nil,
          # Maximum replies threshold.
          max_replies: nil,
          # Maximum retweets threshold.
          max_retweets: nil,
          # Filter by media type.
          media_type: nil,
          # Filter tweets mentioning a username.
          mentioning: nil,
          # Minimum bookmark count threshold.
          min_bookmarks: nil,
          # Deprecated alias of min_likes, sent as minLikes.
          min_faves: nil,
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
          # Optional legacy pagination override. Filters such as keywords don't apply with
          # it.
          mode: nil,
          # Only return native reposts.
          native_retweets: nil,
          # Match a place name.
          near: nil,
          # Only return news results.
          news: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          # Automatic pages accept 1-300 Tweets. Standard pages keep 1-100. Default 20.
          # Continue while has_next_page is true. Deprecated aliases remain accepted.
          page_size: nil,
          # Search within a place ID.
          place: nil,
          # Search within a country code.
          place_country: nil,
          # Geo point radius, such as -73.99 40.73 25mi.
          point_radius: nil,
          # Quote mode.
          quotes: nil,
          # Only quotes of this tweet ID.
          quotes_of_tweet_id: nil,
          # Reply mode.
          replies: nil,
          # Retweet mode.
          retweets: nil,
          # Only retweets of this tweet ID.
          retweets_of_tweet_id: nil,
          # Enable the safe-search filter.
          safe: nil,
          # Start date in YYYY-MM-DD format.
          since_date: nil,
          # Return Tweets newer than this Tweet ID.
          since_id: nil,
          # Inclusive ISO bound for Tweet creation time, such as 2026-09-25T19:20:41Z. Unix
          # seconds also work. A time without an offset is UTC.
          since_time: nil,
          # Match the source application.
          source: nil,
          # Filter replies sent to a username.
          to_user: nil,
          # Keep only posts about this topic. AI-powered analysis asks "Is this post about
          # <topic>?" of each post & keeps scores of 0.5 or more. It reads post text & safe
          # photos. Each kept post costs 2 credits, the AI analysis price, instead of the
          # read price, & a post the filter drops costs nothing. limit counts checked posts,
          # & only kept posts come back. topicFilter states the cutoff & counts.
          topic: nil,
          # End date in YYYY-MM-DD format.
          until_date: nil,
          # Exclusive ISO bound for Tweet creation time. Unix seconds also work. A time
          # without an offset is UTC.
          until_time: nil,
          # URL substring or domain filter.
          url: nil,
          # Only return tweets from verified authors.
          verified_only: nil,
          # Set the radius for the near filter.
          within: nil,
          # Match Tweets inside a recent time window.
          within_time: nil,
          request_options: {}
        )
        end

        # List verified followers of a user
        sig do
          params(
            id: String,
            after: String,
            bio_contains: String,
            blue_verified_only: T::Boolean,
            business_email_only: T::Boolean,
            cursor: String,
            email_domains: String,
            enrich_profiles: T::Boolean,
            fields: String,
            has_email: T::Boolean,
            has_location: T::Boolean,
            has_website: T::Boolean,
            limit: Integer,
            location_contains: String,
            max_followers: Integer,
            max_following: Integer,
            max_scan: Integer,
            max_statuses: Integer,
            min_account_age_days: Integer,
            min_followers: Integer,
            min_following: Integer,
            min_statuses: Integer,
            mode:
              XTwitterScraper::X::UserRetrieveVerifiedFollowersParams::Mode::OrSymbol,
            omit: String,
            page_size: Integer,
            username_contains: String,
            verified_only: T::Boolean,
            verified_type: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(
            XTwitterScraper::Models::X::UserRetrieveVerifiedFollowersResponse::Variants
          )
        end
        def retrieve_verified_followers(
          # User ID or username for verified followers
          id,
          # Legacy cursor alias. Prefer cursor.
          after: nil,
          # Match any comma-separated or line-separated bio term, ignoring case.
          bio_contains: nil,
          # Only return profiles X marks as blue verified. X marks many business &
          # government accounts blue too. Use verifiedType for 1 badge type.
          blue_verified_only: nil,
          # Only return profiles that publish an email outside free webmail, such as Gmail.
          business_email_only: nil,
          # Cursor from the previous response. Xquik cursors resume automatic coverage.
          # Existing unprefixed cursors keep legacy standard behavior.
          cursor: nil,
          # Only return profiles with an email at one of these domains. Separate domains
          # with commas. Subdomains match.
          email_domains: nil,
          # Add each row's full profile, as GET /x/users/{id} returns it. Pages take several
          # seconds longer.
          enrich_profiles: nil,
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
          # Legacy page-size alias outside explicit coverage mode. Coverage accepts 1-10000.
          # Prefer pageSize.
          limit: nil,
          # Match a location substring, ignoring case.
          location_contains: nil,
          # Maximum follower count. Missing counts pass this maximum.
          max_followers: nil,
          # Maximum following count.
          max_following: nil,
          # Most profiles 1 request reads, kept or dropped by the filters. The request then
          # answers the profiles it kept, the count it dropped & the cursor to read on. Each
          # request of a cursor may send its own value. Without it, a filtered read scans at
          # most 100,000 profiles of the list across all its pages, & the page that reaches
          # them ends the list with `scanLimit`. An unfiltered read has no scan limit.
          # Automatic mode only.
          max_scan: nil,
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
          # Omit mode for resumable maximum coverage. Standard keeps legacy pagination.
          # Coverage returns diagnostics once and rejects cursors.
          mode: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          # Maximum user profiles: automatic 300; standard 200. Sources return fewer
          # profiles. Continue with has_next_page.
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

        # Returns the newest posts of users named by user ID, username or profile link, in
        # the order named. Send ids or usernames, not both. Each post costs 1 credit. A
        # user in unavailable_ids or unprocessed_ids costs nothing.
        sig do
          params(
            ids: String,
            usernames: String,
            page_size: Integer,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::BatchUserTweets)
        end
        def retrieve_batch_tweets(
          # Comma-separated numeric IDs of the users to read posts from. Xquik reads any
          # other entry as a username, with or without @, so IDs and usernames can mix.
          # Xquik ignores duplicates and keeps the first-seen order, IDs before usernames. A
          # longer URL fails at the edge before Xquik reads it.
          ids: nil,
          # Comma-separated X usernames, with or without @, or profile links such as
          # x.com/nasa, in place of ids. A name in another case is the same account. A
          # number is a user ID. A longer URL fails at the edge before Xquik reads it.
          usernames: nil,
          # Posts per user (1-300, default 20). A low credit balance can return fewer. Its
          # aliases are limit, count, max_results, maxItems, max_items & per_page.
          page_size: nil,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          request_options: {}
        )
        end

        # Returns the accounts an organization lists as its affiliates, in X's order. An
        # account without affiliates returns an empty list.
        sig do
          params(
            id: String,
            cursor: String,
            page_size: Integer,
            min_followers: Integer,
            max_followers: Integer,
            min_following: Integer,
            max_following: Integer,
            min_statuses: Integer,
            max_statuses: Integer,
            min_account_age_days: Integer,
            verified_only: T::Boolean,
            blue_verified_only: T::Boolean,
            verified_type: String,
            has_website: T::Boolean,
            has_location: T::Boolean,
            has_email: T::Boolean,
            business_email_only: T::Boolean,
            email_domains: String,
            bio_contains: String,
            location_contains: String,
            username_contains: String,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::PaginatedUsers)
        end
        def retrieve_affiliates(
          id,
          # Pagination cursor for collection results. Also read as next_cursor, next_token,
          # pagination_token or continuation_token.
          cursor: nil,
          # Profiles to request from this page. A page holds up to 10,000, so a larger
          # pageSize gets the largest page. Default 200. Source, filters or credits can
          # return fewer. Follow next_cursor for more pages. Its aliases are limit, count,
          # max_results, maxItems, max_items & per_page.
          page_size: nil,
          # Minimum follower count. Profiles the filter drops cost nothing.
          min_followers: nil,
          # Maximum follower count. A profile without a count passes.
          max_followers: nil,
          # Profiles must follow at least this many accounts.
          min_following: nil,
          # Profiles may follow at most this many accounts.
          max_following: nil,
          # Minimum post count. minPosts is also accepted.
          min_statuses: nil,
          # Maximum post count. maxPosts is also accepted.
          max_statuses: nil,
          # Minimum account age in whole days.
          min_account_age_days: nil,
          # Only return verified profiles.
          verified_only: nil,
          # Only return profiles X marks as blue verified. X marks many business &
          # government accounts blue too. Use verifiedType for 1 badge type.
          blue_verified_only: nil,
          # Match the verification type exactly, ignoring case.
          verified_type: nil,
          # Only return profiles with a website.
          has_website: nil,
          # Only return profiles with a location.
          has_location: nil,
          # Only return profiles that publish an email.
          has_email: nil,
          # Only return profiles that publish an email outside free webmail, such as Gmail.
          business_email_only: nil,
          # Only return profiles with an email at one of these domains. Separate domains
          # with commas. Subdomains match.
          email_domains: nil,
          # Match any comma-separated or line-separated bio term, ignoring case.
          bio_contains: nil,
          # Match a location substring, ignoring case.
          location_contains: nil,
          # Match a username substring, ignoring case.
          username_contains: nil,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          request_options: {}
        )
        end

        # Returns the posts on the user's Articles tab, newest first. Each post's
        # `article` holds the Article's ID, title, preview, cover & dates. Read the full
        # text with GET /x/articles/{tweetId}.
        sig do
          params(
            id: String,
            cursor: String,
            page_size: Integer,
            from_user: String,
            to_user: String,
            mentioning: String,
            language: String,
            since_date: Date,
            until_date: Date,
            media_type:
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::MediaType::OrSymbol,
            min_likes: Integer,
            min_retweets: Integer,
            min_replies: Integer,
            min_quotes: Integer,
            min_views: Integer,
            min_bookmarks: Integer,
            max_faves: Integer,
            max_retweets: Integer,
            max_replies: Integer,
            max_quotes: Integer,
            blue_verified_only: T::Boolean,
            since_id: String,
            max_id: String,
            within_time: String,
            native_retweets: T::Boolean,
            verified_only: T::Boolean,
            replies:
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::Replies::OrSymbol,
            retweets:
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::Retweets::OrSymbol,
            quotes:
              XTwitterScraper::Models::X::UserRetrieveArticlesParams::Quotes::OrSymbol,
            exact_phrase: String,
            exclude_words: String,
            any_words: String,
            hashtags: String,
            cashtags: String,
            url: String,
            conversation_id: String,
            in_reply_to_tweet_id: String,
            quotes_of_tweet_id: String,
            retweets_of_tweet_id: String,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::PaginatedTweets)
        end
        def retrieve_articles(
          id,
          # Pagination cursor for collection results. Also read as next_cursor, next_token,
          # pagination_token or continuation_token.
          cursor: nil,
          # Items per page. A page holds up to 10,000, so a larger pageSize gets the largest
          # page. Default 20. Source, filters or credits can return fewer. Follow
          # next_cursor for more pages. Its aliases are limit, count, max_results, maxItems,
          # max_items & per_page.
          page_size: nil,
          # Filter by author username. Account searches include all of the account's posts &
          # reposts.
          from_user: nil,
          # Filter replies sent to a username.
          to_user: nil,
          # Filter tweets mentioning a username.
          mentioning: nil,
          # Filter by language. Its alias is `lang`. Language filters work for every
          # language X tags.
          language: nil,
          # Start date in YYYY-MM-DD format, as a UTC day. A date means one thing in any
          # common form.
          since_date: nil,
          # End date in YYYY-MM-DD format, as a UTC day, inclusive, so its own posts count.
          until_date: nil,
          # Filter media. Its aliases are has_video & has_media.
          media_type: nil,
          # Minimum likes. Its aliases are minFaves, min_likes & min_faves.
          min_likes: nil,
          # Minimum retweets threshold.
          min_retweets: nil,
          # Minimum replies threshold.
          min_replies: nil,
          # Minimum quote count threshold.
          min_quotes: nil,
          # Minimum view count threshold.
          min_views: nil,
          # Minimum bookmark count threshold.
          min_bookmarks: nil,
          # Maximum likes threshold. maxLikes & max_likes also work.
          max_faves: nil,
          # Maximum retweets threshold.
          max_retweets: nil,
          # Maximum replies threshold.
          max_replies: nil,
          # Maximum quotes threshold.
          max_quotes: nil,
          # Only return tweets from Blue-verified authors.
          blue_verified_only: nil,
          # Return Tweets whose IDs exceed this ID. Searches accept `since_id` & `max_id`
          # bounds.
          since_id: nil,
          # Return Tweets at or below this ID.
          max_id: nil,
          # Keeps Tweets from a recent window, such as 90m or 7d. Use a whole number & s, m,
          # h or d.
          within_time: nil,
          # Only return native reposts.
          native_retweets: nil,
          # Only return tweets from verified authors.
          verified_only: nil,
          # Reply mode. Exclude keeps own-thread replies.
          replies: nil,
          # Only when the caller requests a repost mode.
          retweets: nil,
          # Only when the caller requests a quote mode.
          quotes: nil,
          # Match this exact phrase, word for word.
          exact_phrase: nil,
          # Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
          exclude_words: nil,
          # Words or quoted phrases where any one can match. Separate with spaces, commas,
          # or lines.
          any_words: nil,
          # Hashtags separated by spaces, commas, or lines.
          hashtags: nil,
          # Cashtags separated by spaces, commas, or lines.
          cashtags: nil,
          # URL substring or domain filter.
          url: nil,
          # Conversation ID filter.
          conversation_id: nil,
          # Only replies to this tweet ID.
          in_reply_to_tweet_id: nil,
          # Only quotes of this tweet ID.
          quotes_of_tweet_id: nil,
          # Only retweets of this tweet ID.
          retweets_of_tweet_id: nil,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          request_options: {}
        )
        end

        # Reads the newest followers of a public account & returns a follower audit. It
        # gives each follower 1 class with its score & signals, then adds coverage, a
        # quality score, signal counts, arrival bands, join cohorts, countries, top
        # followers & the account's engagement. Each follower read costs 1 credit, and the
        # engagement adds 1 credit. Signals come from public profiles, so a real person
        # can match. Older followers may differ from the newest ones.
        sig do
          params(
            id: String,
            limit: Integer,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(
            XTwitterScraper::Models::X::UserRetrieveFollowerAuditResponse
          )
        end
        def retrieve_follower_audit(
          # User ID, username with or without @, or URL-encoded profile URL, such as
          # x.com/nasa or x.com/i/user/11348282. A number is a user ID. Writes look up a
          # username's ID before sending. Anything else gets 400 `invalid_user_id`.
          id,
          # Most followers to read, newest first. Left out, a read takes up to 200 and a low
          # balance reads fewer. A very long read returns what it finished, & coverage shows
          # how many. Its aliases are pageSize, count, max_results, maxItems, max_items &
          # per_page.
          limit: nil,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          request_options: {}
        )
        end

        # Returns the user IDs of the selected user's followers, newest first, up to 5,000
        # a page. Use it when you need IDs only. Each ID costs 1 credit.
        sig do
          params(
            id: String,
            cursor: String,
            page_size: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::PaginatedUserIds)
        end
        def retrieve_follower_ids(
          id,
          # Pagination cursor for collection results. Also read as next_cursor, next_token,
          # pagination_token or continuation_token.
          cursor: nil,
          # User IDs to request from this page (1-5000, default 5000). A low credit balance
          # can return fewer. Follow next_cursor for more pages. Its aliases are limit,
          # count, max_results, maxItems, max_items & per_page.
          page_size: nil,
          request_options: {}
        )
        end

        # Returns the user IDs of the accounts the selected user follows, newest first, up
        # to 5,000 a page. Use it when you need IDs only. Each ID costs 1 credit.
        sig do
          params(
            id: String,
            cursor: String,
            page_size: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::PaginatedUserIds)
        end
        def retrieve_following_ids(
          id,
          # Pagination cursor for collection results. Also read as next_cursor, next_token,
          # pagination_token or continuation_token.
          cursor: nil,
          # User IDs to request from this page (1-5000, default 5000). A low credit balance
          # can return fewer. Follow next_cursor for more pages. Its aliases are limit,
          # count, max_results, maxItems, max_items & per_page.
          page_size: nil,
          request_options: {}
        )
        end

        # Returns the posts on the user's Highlights tab, in X's order. An account without
        # highlights returns an empty list.
        sig do
          params(
            id: String,
            cursor: String,
            page_size: Integer,
            from_user: String,
            to_user: String,
            mentioning: String,
            language: String,
            since_date: Date,
            until_date: Date,
            media_type:
              XTwitterScraper::Models::X::UserRetrieveHighlightsParams::MediaType::OrSymbol,
            min_likes: Integer,
            min_retweets: Integer,
            min_replies: Integer,
            min_quotes: Integer,
            min_views: Integer,
            min_bookmarks: Integer,
            max_faves: Integer,
            max_retweets: Integer,
            max_replies: Integer,
            max_quotes: Integer,
            blue_verified_only: T::Boolean,
            since_id: String,
            max_id: String,
            within_time: String,
            native_retweets: T::Boolean,
            verified_only: T::Boolean,
            replies:
              XTwitterScraper::Models::X::UserRetrieveHighlightsParams::Replies::OrSymbol,
            retweets:
              XTwitterScraper::Models::X::UserRetrieveHighlightsParams::Retweets::OrSymbol,
            quotes:
              XTwitterScraper::Models::X::UserRetrieveHighlightsParams::Quotes::OrSymbol,
            exact_phrase: String,
            exclude_words: String,
            any_words: String,
            hashtags: String,
            cashtags: String,
            url: String,
            conversation_id: String,
            in_reply_to_tweet_id: String,
            quotes_of_tweet_id: String,
            retweets_of_tweet_id: String,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::PaginatedTweets)
        end
        def retrieve_highlights(
          id,
          # Pagination cursor for collection results. Also read as next_cursor, next_token,
          # pagination_token or continuation_token.
          cursor: nil,
          # Items per page. A page holds up to 10,000, so a larger pageSize gets the largest
          # page. Default 20. Source, filters or credits can return fewer. Follow
          # next_cursor for more pages. Its aliases are limit, count, max_results, maxItems,
          # max_items & per_page.
          page_size: nil,
          # Filter by author username. Account searches include all of the account's posts &
          # reposts.
          from_user: nil,
          # Filter replies sent to a username.
          to_user: nil,
          # Filter tweets mentioning a username.
          mentioning: nil,
          # Filter by language. Its alias is `lang`. Language filters work for every
          # language X tags.
          language: nil,
          # Start date in YYYY-MM-DD format, as a UTC day. A date means one thing in any
          # common form.
          since_date: nil,
          # End date in YYYY-MM-DD format, as a UTC day, inclusive, so its own posts count.
          until_date: nil,
          # Filter media. Its aliases are has_video & has_media.
          media_type: nil,
          # Minimum likes. Its aliases are minFaves, min_likes & min_faves.
          min_likes: nil,
          # Minimum retweets threshold.
          min_retweets: nil,
          # Minimum replies threshold.
          min_replies: nil,
          # Minimum quote count threshold.
          min_quotes: nil,
          # Minimum view count threshold.
          min_views: nil,
          # Minimum bookmark count threshold.
          min_bookmarks: nil,
          # Maximum likes threshold. maxLikes & max_likes also work.
          max_faves: nil,
          # Maximum retweets threshold.
          max_retweets: nil,
          # Maximum replies threshold.
          max_replies: nil,
          # Maximum quotes threshold.
          max_quotes: nil,
          # Only return tweets from Blue-verified authors.
          blue_verified_only: nil,
          # Return Tweets whose IDs exceed this ID. Searches accept `since_id` & `max_id`
          # bounds.
          since_id: nil,
          # Return Tweets at or below this ID.
          max_id: nil,
          # Keeps Tweets from a recent window, such as 90m or 7d. Use a whole number & s, m,
          # h or d.
          within_time: nil,
          # Only return native reposts.
          native_retweets: nil,
          # Only return tweets from verified authors.
          verified_only: nil,
          # Reply mode. Exclude keeps own-thread replies.
          replies: nil,
          # Only when the caller requests a repost mode.
          retweets: nil,
          # Only when the caller requests a quote mode.
          quotes: nil,
          # Match this exact phrase, word for word.
          exact_phrase: nil,
          # Words or quoted phrases to exclude. Separate with spaces, commas, or lines.
          exclude_words: nil,
          # Words or quoted phrases where any one can match. Separate with spaces, commas,
          # or lines.
          any_words: nil,
          # Hashtags separated by spaces, commas, or lines.
          hashtags: nil,
          # Cashtags separated by spaces, commas, or lines.
          cashtags: nil,
          # URL substring or domain filter.
          url: nil,
          # Conversation ID filter.
          conversation_id: nil,
          # Only replies to this tweet ID.
          in_reply_to_tweet_id: nil,
          # Only quotes of this tweet ID.
          quotes_of_tweet_id: nil,
          # Only retweets of this tweet ID.
          retweets_of_tweet_id: nil,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          request_options: {}
        )
        end

        # Returns engagement insights for 1 profile. They are engagement rate, averages
        # per post and posting rate, from its counts and its most recent posts. It reads
        # 20 posts unless limit names another number. Reposts and the pinned post stay out
        # of the averages. Each report costs 1 credit, whatever it reads.
        sig do
          params(
            id: String,
            limit: Integer,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::UserRetrieveInsightsResponse)
        end
        def retrieve_insights(
          # User ID, username with or without @, or URL-encoded profile URL, such as
          # x.com/nasa or x.com/i/user/11348282. A number is a user ID. Writes look up a
          # username's ID before sending. Anything else gets 400 `invalid_user_id`.
          id,
          # Recent posts to read for the averages and rates. The read stops at this count,
          # at the account's oldest post or after about 40 seconds. `sample.read` says how
          # many it read, and `sample.posts` how many of those the averages used.
          # `pageSize`, `count`, `max_results`, `maxItems`, `max_items` & `per_page` are
          # accepted aliases.
          limit: nil,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          request_options: {}
        )
        end

        # Returns the public X Lists that include the selected user, as the profile's List
        # memberships page shows them. Each List costs 1 credit. A protected account
        # answers 403.
        sig do
          params(
            id: String,
            cursor: String,
            page_size: Integer,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::PaginatedLists)
        end
        def retrieve_list_memberships(
          id,
          # Pagination cursor for collection results. Also read as next_cursor, next_token,
          # pagination_token or continuation_token.
          cursor: nil,
          # Items per page. A page holds up to 10,000, so a larger pageSize gets the largest
          # page. Default 20. Source, filters or credits can return fewer. Follow
          # next_cursor for more pages. Its aliases are limit, count, max_results, maxItems,
          # max_items & per_page.
          page_size: nil,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          request_options: {}
        )
        end

        # Returns the public X Lists the selected user created, in X's order, as the
        # profile's Lists tab shows them. Each List costs 1 credit. A protected account
        # answers 403.
        sig do
          params(
            id: String,
            cursor: String,
            page_size: Integer,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::PaginatedLists)
        end
        def retrieve_lists(
          id,
          # Pagination cursor for collection results. Also read as next_cursor, next_token,
          # pagination_token or continuation_token.
          cursor: nil,
          # Items per page. A page holds up to 10,000, so a larger pageSize gets the largest
          # page. Default 20. Source, filters or credits can return fewer. Follow
          # next_cursor for more pages. Its aliases are limit, count, max_results, maxItems,
          # max_items & per_page.
          page_size: nil,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          request_options: {}
        )
        end

        # Says whether 1 user is broadcasting live video on X right now, with their latest
        # broadcast, live or ended. Each check costs 1 credit.
        sig do
          params(
            id: String,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::UserLiveStatus)
        end
        def retrieve_live(
          # User ID, username with or without @, or URL-encoded profile URL, such as
          # x.com/nasa or x.com/i/user/11348282. A number is a user ID. Writes look up a
          # username's ID before sending. Anything else gets 400 `invalid_user_id`.
          id,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          request_options: {}
        )
        end

        # Checks 1 X account for a search ban, a search suggestion ban, reply deboosting &
        # a reply lock. It also tests timeline visibility & early engagement, reads the
        # sensitive flag & the countries that withhold the account, and says if the
        # account is active, protected or suspended. Each check answers pass, fail or
        # unknown, with its reason & what it read. `overall` sums up the checks, and
        # `checkedAt` holds the time of the check. The reply checks and the engagement
        # check answer pass or unknown, since X ranks replies for each viewer and a drop
        # alone proves nothing. A protected account skips the checks that need public
        # posts, and a suspended account gets the account check only. Each profile, post,
        # suggestion & reply in the answer costs 1 credit. The timeline, engagement &
        # reply checks read the account's 20 most recent posts unless `limit` names
        # another number. Shadowban checks show if X search lists an account, with each
        # post they read.
        sig do
          params(
            id: String,
            limit: Integer,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::ShadowbanReport)
        end
        def retrieve_shadowban(
          # User ID, username with or without @, or URL-encoded profile URL, such as
          # x.com/nasa or x.com/i/user/11348282. A number is a user ID. Writes look up a
          # username's ID before sending. Anything else gets 400 `invalid_user_id`.
          id,
          # Recent posts to read for the timeline, engagement & reply checks. The read stops
          # at this count, at the account's oldest post or after about 40 seconds.
          # `pageSize`, `count`, `max_results`, `maxItems`, `max_items` & `per_page` are
          # accepted aliases.
          limit: nil,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          request_options: {}
        )
        end

        # Returns the public accounts X lists as similar to the selected user, in X's
        # order. Each account costs 1 credit. Similar-account lists come back fuller.
        sig do
          params(
            id: String,
            cursor: String,
            page_size: Integer,
            min_followers: Integer,
            max_followers: Integer,
            min_following: Integer,
            max_following: Integer,
            min_statuses: Integer,
            max_statuses: Integer,
            min_account_age_days: Integer,
            verified_only: T::Boolean,
            blue_verified_only: T::Boolean,
            verified_type: String,
            has_website: T::Boolean,
            has_location: T::Boolean,
            has_email: T::Boolean,
            business_email_only: T::Boolean,
            email_domains: String,
            bio_contains: String,
            location_contains: String,
            username_contains: String,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::PaginatedUsers)
        end
        def retrieve_similar(
          id,
          # Pagination cursor for collection results. Also read as next_cursor, next_token,
          # pagination_token or continuation_token.
          cursor: nil,
          # Profiles to request from this page. A page holds up to 10,000, so a larger
          # pageSize gets the largest page. Default 200. Source, filters or credits can
          # return fewer. Follow next_cursor for more pages. Its aliases are limit, count,
          # max_results, maxItems, max_items & per_page.
          page_size: nil,
          # Minimum follower count. Profiles the filter drops cost nothing.
          min_followers: nil,
          # Maximum follower count. A profile without a count passes.
          max_followers: nil,
          # Profiles must follow at least this many accounts.
          min_following: nil,
          # Profiles may follow at most this many accounts.
          max_following: nil,
          # Minimum post count. minPosts is also accepted.
          min_statuses: nil,
          # Maximum post count. maxPosts is also accepted.
          max_statuses: nil,
          # Minimum account age in whole days.
          min_account_age_days: nil,
          # Only return verified profiles.
          verified_only: nil,
          # Only return profiles X marks as blue verified. X marks many business &
          # government accounts blue too. Use verifiedType for 1 badge type.
          blue_verified_only: nil,
          # Match the verification type exactly, ignoring case.
          verified_type: nil,
          # Only return profiles with a website.
          has_website: nil,
          # Only return profiles with a location.
          has_location: nil,
          # Only return profiles that publish an email.
          has_email: nil,
          # Only return profiles that publish an email outside free webmail, such as Gmail.
          business_email_only: nil,
          # Only return profiles with an email at one of these domains. Separate domains
          # with commas. Subdomains match.
          email_domains: nil,
          # Match any comma-separated or line-separated bio term, ignoring case.
          bio_contains: nil,
          # Match a location substring, ignoring case.
          location_contains: nil,
          # Match a username substring, ignoring case.
          username_contains: nil,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          request_options: {}
        )
        end

        # Returns the creators the selected user subscribes to, in X's order. An account
        # that hides its subscriptions returns an empty list.
        sig do
          params(
            id: String,
            cursor: String,
            page_size: Integer,
            min_followers: Integer,
            max_followers: Integer,
            min_following: Integer,
            max_following: Integer,
            min_statuses: Integer,
            max_statuses: Integer,
            min_account_age_days: Integer,
            verified_only: T::Boolean,
            blue_verified_only: T::Boolean,
            verified_type: String,
            has_website: T::Boolean,
            has_location: T::Boolean,
            has_email: T::Boolean,
            business_email_only: T::Boolean,
            email_domains: String,
            bio_contains: String,
            location_contains: String,
            username_contains: String,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::PaginatedUsers)
        end
        def retrieve_subscriptions(
          id,
          # Pagination cursor for collection results. Also read as next_cursor, next_token,
          # pagination_token or continuation_token.
          cursor: nil,
          # Profiles to request from this page. A page holds up to 10,000, so a larger
          # pageSize gets the largest page. Default 200. Source, filters or credits can
          # return fewer. Follow next_cursor for more pages. Its aliases are limit, count,
          # max_results, maxItems, max_items & per_page.
          page_size: nil,
          # Minimum follower count. Profiles the filter drops cost nothing.
          min_followers: nil,
          # Maximum follower count. A profile without a count passes.
          max_followers: nil,
          # Profiles must follow at least this many accounts.
          min_following: nil,
          # Profiles may follow at most this many accounts.
          max_following: nil,
          # Minimum post count. minPosts is also accepted.
          min_statuses: nil,
          # Maximum post count. maxPosts is also accepted.
          max_statuses: nil,
          # Minimum account age in whole days.
          min_account_age_days: nil,
          # Only return verified profiles.
          verified_only: nil,
          # Only return profiles X marks as blue verified. X marks many business &
          # government accounts blue too. Use verifiedType for 1 badge type.
          blue_verified_only: nil,
          # Match the verification type exactly, ignoring case.
          verified_type: nil,
          # Only return profiles with a website.
          has_website: nil,
          # Only return profiles with a location.
          has_location: nil,
          # Only return profiles that publish an email.
          has_email: nil,
          # Only return profiles that publish an email outside free webmail, such as Gmail.
          business_email_only: nil,
          # Only return profiles with an email at one of these domains. Separate domains
          # with commas. Subdomains match.
          email_domains: nil,
          # Match any comma-separated or line-separated bio term, ignoring case.
          bio_contains: nil,
          # Match a location substring, ignoring case.
          location_contains: nil,
          # Match a username substring, ignoring case.
          username_contains: nil,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          request_options: {}
        )
        end

        # Returns X's own translation of 1 profile's bio into the language you pick, with
        # the links, mentions, and tags X places in the translated text. A profile without
        # a bio returns translation null & a message, free of charge. Posts & bios can be
        # translated into your language.
        sig do
          params(
            id: String,
            language: String,
            fields: String,
            omit: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::UserTranslateBioResponse)
        end
        def translate_bio(
          # User ID, username with or without @, or URL-encoded profile URL, such as
          # x.com/nasa or x.com/i/user/11348282. A number is a user ID. Writes look up a
          # username's ID before sending. Anything else gets 400 `invalid_user_id`.
          id,
          # Language code to translate into, such as `es`, `tr`, `pt-br`, or `zh-tw`. Upper
          # and lower case both work.
          language:,
          # Fields to keep in each row, comma-separated. Use dots for nested fields, such as
          # author.username. A list keeps the field in each item. Case & underscores do not
          # matter. A row that lacks a field leaves it out. Cursors, counts & diagnostics
          # always stay. An unknown name answers 400 unknown_field with the valid names,
          # before any read. The price stays the same. SDK row types then hold only the
          # named fields. A longer URL fails at the edge before Xquik reads it. Pick only
          # the fields you need with `fields` & `omit`.
          fields: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
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
