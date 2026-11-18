# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Communities
        class Media
          # Returns the tweets with photos or videos on 1 community's Media tab, newest
          # first. Each tweet costs 1 credit.
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
                XTwitterScraper::Models::X::Communities::MediaListParams::MediaType::OrSymbol,
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
                XTwitterScraper::Models::X::Communities::MediaListParams::Replies::OrSymbol,
              retweets:
                XTwitterScraper::Models::X::Communities::MediaListParams::Retweets::OrSymbol,
              quotes:
                XTwitterScraper::Models::X::Communities::MediaListParams::Quotes::OrSymbol,
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
          def list(
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
