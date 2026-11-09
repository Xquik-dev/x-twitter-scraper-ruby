# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Communities
        # X Community info, members, and tweets
        class Tweets
          # Requires a Community ID and keyword query.
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
              media_type:
                XTwitterScraper::X::Communities::TweetListParams::MediaType::OrSymbol,
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
                XTwitterScraper::X::Communities::TweetListParams::QueryType::OrSymbol,
              quotes:
                XTwitterScraper::X::Communities::TweetListParams::Quotes::OrSymbol,
              quotes_of_tweet_id: String,
              replies:
                XTwitterScraper::X::Communities::TweetListParams::Replies::OrSymbol,
              retweets:
                XTwitterScraper::X::Communities::TweetListParams::Retweets::OrSymbol,
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
          def list(
            # Numeric ID of the community to search
            community_id:,
            # Keyword query within the selected community
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
            # Pagination cursor for community results
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
            # Sort order for community results (Latest or Top)
            query_type: nil,
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

          # List tweets posted in a community
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
                XTwitterScraper::X::Communities::TweetListByCommunityParams::MediaType::OrSymbol,
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
                XTwitterScraper::X::Communities::TweetListByCommunityParams::QueryType::OrSymbol,
              quotes:
                XTwitterScraper::X::Communities::TweetListByCommunityParams::Quotes::OrSymbol,
              quotes_of_tweet_id: String,
              replies:
                XTwitterScraper::X::Communities::TweetListByCommunityParams::Replies::OrSymbol,
              retweets:
                XTwitterScraper::X::Communities::TweetListByCommunityParams::Retweets::OrSymbol,
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
          def list_by_community(
            # Community ID for tweet lookup
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
            # Pagination cursor for community tweets
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
            # Latest for newest first, or Top for the posts X ranks highest. Any case works.
            # Aliases ranking & sort, which also take Recency & Relevance. Send the same value
            # with each cursor.
            query_type: nil,
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
end
