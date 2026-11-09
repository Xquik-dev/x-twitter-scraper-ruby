# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    class X
      # X List followers, members, and tweets
      class Lists
        # List followers of an X List
        sig do
          params(
            id: String,
            after: String,
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
            max_scan: Integer,
            max_statuses: Integer,
            min_account_age_days: Integer,
            min_followers: Integer,
            min_following: Integer,
            min_statuses: Integer,
            mode:
              XTwitterScraper::X::ListRetrieveFollowersParams::Mode::OrSymbol,
            omit: String,
            page_size: Integer,
            username_contains: String,
            verified_only: T::Boolean,
            verified_type: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(
            XTwitterScraper::Models::X::ListRetrieveFollowersResponse::Variants
          )
        end
        def retrieve_followers(
          # List ID
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
          # Pagination cursor for list followers
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

        # List members of an X List
        sig do
          params(
            id: String,
            after: String,
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
            max_scan: Integer,
            max_statuses: Integer,
            min_account_age_days: Integer,
            min_followers: Integer,
            min_following: Integer,
            min_statuses: Integer,
            mode: XTwitterScraper::X::ListRetrieveMembersParams::Mode::OrSymbol,
            omit: String,
            page_size: Integer,
            username_contains: String,
            verified_only: T::Boolean,
            verified_type: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(
            XTwitterScraper::Models::X::ListRetrieveMembersResponse::Variants
          )
        end
        def retrieve_members(
          # List ID for member lookup
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
          # Pagination cursor for list members
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
          # Members per page (20-200, default 20)
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

        # List tweets from an X List
        sig do
          params(
            id: String,
            advanced_query: String,
            after: String,
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
            in_reply_to_tweet_id: String,
            include_replies: T::Boolean,
            keywords: String,
            language: String,
            max_faves: Integer,
            max_id: String,
            max_quotes: Integer,
            max_replies: Integer,
            max_retweets: Integer,
            media_type:
              XTwitterScraper::X::ListRetrieveTweetsParams::MediaType::OrSymbol,
            mentioning: String,
            min_bookmarks: Integer,
            min_likes: Integer,
            min_quotes: Integer,
            min_replies: Integer,
            min_retweets: Integer,
            min_views: Integer,
            mode: XTwitterScraper::X::ListRetrieveTweetsParams::Mode::OrSymbol,
            native_retweets: T::Boolean,
            near: String,
            news: T::Boolean,
            omit: String,
            page_size: Integer,
            place: String,
            place_country: String,
            point_radius: String,
            quotes:
              XTwitterScraper::X::ListRetrieveTweetsParams::Quotes::OrSymbol,
            quotes_of_tweet_id: String,
            replies:
              XTwitterScraper::X::ListRetrieveTweetsParams::Replies::OrSymbol,
            retweets:
              XTwitterScraper::X::ListRetrieveTweetsParams::Retweets::OrSymbol,
            retweets_of_tweet_id: String,
            safe: T::Boolean,
            since_date: Date,
            since_id: String,
            since_time: String,
            source: String,
            to_user: String,
            until_date: Date,
            until_time: String,
            url: String,
            verified_only: T::Boolean,
            within: String,
            within_time: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::PaginatedTweets)
        end
        def retrieve_tweets(
          # List ID for tweet lookup
          id,
          # Raw advanced search query appended as-is.
          advanced_query: nil,
          # Legacy cursor alias. Prefer cursor.
          after: nil,
          # Words or quoted phrases where any one can match. Separate with spaces, commas,
          # or lines.
          any_words: nil,
          # Only return tweets from Blue-verified authors.
          blue_verified_only: nil,
          # Geo bounding box, such as -74.1 40.6 -73.9 40.8.
          bounding_box: nil,
          # Keep only Tweets with this card type, such as poll2choice_text_only. Every
          # returned Tweet has it.
          card_name: nil,
          # Cashtags separated by spaces, commas, or lines.
          cashtags: nil,
          # Conversation ID filter.
          conversation_id: nil,
          # Pagination cursor for list tweets
          cursor: nil,
          # Match this exact phrase, word for word.
          exact_phrase: nil,
          # `excludeSource` isn't supported. A Tweet search with it answers 424 & charges
          # nothing.
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
          # Filter by author username. Account searches include all of the account's posts &
          # reposts.
          from_user: nil,
          # `geocode` isn't supported. A Tweet search with it answers 424 & charges nothing.
          geocode: nil,
          # Hashtags separated by spaces, commas, or lines.
          hashtags: nil,
          # Only replies to this tweet ID.
          in_reply_to_tweet_id: nil,
          # Include replies (default false)
          include_replies: nil,
          # Words the Tweets must match, in X search syntax.
          keywords: nil,
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
          # Filter media. Its aliases are has_video & has_media.
          media_type: nil,
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
          # Omit mode for resumable maximum coverage. Standard keeps legacy pagination.
          # Coverage returns diagnostics once and rejects cursors.
          mode: nil,
          # Only return native reposts.
          native_retweets: nil,
          # A place name, such as a city or a country. Matching Tweets are tagged in or
          # about that place.
          near: nil,
          # `news` isn't supported. A Tweet search with it answers 424 & charges nothing.
          news: nil,
          # Fields to drop from each row, comma-separated. It takes the same names as
          # fields. With fields, it drops from the kept fields. A longer URL fails at the
          # edge before Xquik reads it.
          omit: nil,
          # Maximum page items (1-100, default 20). Source, filters, or credits can reduce
          # results. Continue while has_next_page is true. Deprecated limit and count
          # aliases remain accepted.
          page_size: nil,
          # Search within a place ID.
          place: nil,
          # Search within a country code.
          place_country: nil,
          # Geo point radius, such as -73.99 40.73 25mi.
          point_radius: nil,
          # Only when the caller requests a quote mode.
          quotes: nil,
          # Only quotes of this tweet ID.
          quotes_of_tweet_id: nil,
          # Reply mode. Exclude keeps own-thread replies.
          replies: nil,
          # Only when the caller requests a repost mode.
          retweets: nil,
          # Only retweets of this tweet ID.
          retweets_of_tweet_id: nil,
          # Enable the safe-search filter.
          safe: nil,
          # Start date in YYYY-MM-DD format, as a UTC day. A date means one thing in any
          # common form.
          since_date: nil,
          # Return Tweets whose IDs exceed this ID. Searches accept `since_id` & `max_id`
          # bounds.
          since_id: nil,
          # Unix timestamp - filter after
          since_time: nil,
          # `source` isn't supported. A Tweet search with it answers 424 & charges nothing.
          source: nil,
          # Filter replies sent to a username.
          to_user: nil,
          # End date in YYYY-MM-DD format, as a UTC day, inclusive, so its own posts count.
          until_date: nil,
          # Unix timestamp - filter before
          until_time: nil,
          # URL substring or domain filter.
          url: nil,
          # Only return tweets from verified authors.
          verified_only: nil,
          # `within` isn't supported. A Tweet search with it answers 424 & charges nothing.
          # Use near alone.
          within: nil,
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
