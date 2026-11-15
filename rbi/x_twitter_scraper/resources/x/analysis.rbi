# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    class X
      # AI analysis of posts, at 2 credits per analyzed post
      class Analysis
        # Answers whether each post is about your brand, the author's attitude toward it &
        # the author's relationship with it. Name the brand in analysis.targets. Each
        # analyzed post costs 2 credits.
        sig do
          params(
            tweet_ids: T::Array[String],
            query: String,
            username: String,
            list_id: String,
            quotes_of: String,
            replies_to: String,
            queries: T::Array[String],
            usernames: T::Array[String],
            list_ids: T::Array[String],
            thread_of: String,
            replies_by: String,
            media_by: String,
            liked_by: String,
            since_time:
              XTwitterScraper::X::TweetAnalysisParams::SinceTime::Variants,
            until_time:
              XTwitterScraper::X::TweetAnalysisParams::UntilTime::Variants,
            query_type:
              XTwitterScraper::X::TweetAnalysisParams::QueryType::OrSymbol,
            limit: Integer,
            cursor: String,
            texts: T::Array[String],
            topic: String,
            image_shows: String,
            analysis: XTwitterScraper::X::TweetAnalysisParams::Analysis::OrHash,
            baseline:
              T::Array[
                XTwitterScraper::X::TweetAnalysisParams::Baseline::OrHash
              ],
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::TweetAnalysisPage)
        end
        def brand(
          # Post IDs or post URLs to analyze, up to 100.
          tweet_ids: nil,
          # X search to analyze, with the operators of /x/tweets/search, such as from:nasa
          # or lang:en. X searches up to 512 characters, counted with the other search
          # fields, as /x/tweets/search counts q.
          query: nil,
          # Analyze 1 account's posts. Send a handle, with or without @, or a profile URL.
          username: nil,
          # Analyze a public List's posts. Send its ID or URL.
          list_id: nil,
          # Analyze the quotes of 1 post. Send its ID or URL.
          quotes_of: nil,
          # Analyze the replies in 1 post's conversation. Send its ID or URL.
          replies_to: nil,
          # X searches to analyze as 1 search. A post matching any of them
          # counts. Each takes the operators of query. query, when sent, joins
          # them. X searches up to 512 characters, counted with the other search
          # fields.
          queries: nil,
          # Analyze the posts of several accounts in 1 search. Send handles,
          # with or without @, or profile URLs. username, when sent, joins them.
          usernames: nil,
          # Analyze the posts of several public Lists in 1 search. Send their
          # IDs or URLs. listId, when sent, joins them.
          list_ids: nil,
          # Analyze 1 post's thread, as /x/tweets/{id}/thread reads it. Send the
          # post's ID or URL. Send no other posts or search with it.
          thread_of: nil,
          # Analyze 1 account's posts & replies, as its Replies tab shows them.
          # /x/users/{id}/replies reads the same posts. Send a handle, with or
          # without @, a user ID or a profile URL. Send no other posts or search
          # with it.
          replies_by: nil,
          # Analyze 1 account's posts with photos or videos, as its Media tab
          # shows them. /x/users/{id}/media reads the same posts. Send a handle,
          # with or without @, a user ID or a profile URL. Send no other posts
          # or search with it.
          media_by: nil,
          # Analyze the posts 1 account liked, as /x/users/{id}/likes reads
          # them. Send a handle, with or without @, a user ID or a profile URL.
          # Send no other posts or search with it.
          liked_by: nil,
          # Inclusive start of the search, such as 2026-09-25T00:00:00Z. Unix seconds also
          # work. A time without an offset is UTC.
          since_time: nil,
          # Exclusive end of the search, such as 2026-09-26T00:00:00Z. Unix seconds also
          # work. A time without an offset is UTC.
          until_time: nil,
          # Search order. Default Latest.
          query_type: nil,
          # Maximum posts to analyze from the search. A low credit balance can return fewer.
          limit: nil,
          # The next_cursor of the page before. Send the same search with it.
          cursor: nil,
          # Your own texts to analyze, such as drafts. Reads nothing from X. Each text costs
          # the same as 1 analyzed post.
          texts: nil,
          # Keep only posts about this topic, the same as the Actors' topic input.
          # AI-powered analysis asks "Is this post about <topic>?" of each post & keeps
          # scores of 0.5 or more. Only kept posts are analyzed & cost 2 credits each, & a
          # post the filter drops costs nothing. topicFilter states the cutoff & counts.
          # Send topic or imageShows, not both.
          topic: nil,
          # Keep only posts whose photos show this, the same as the Actors' imageShows
          # input. Send charts, screenshots, product_photos, memes or people, or describe it
          # in words, such as a rocket. AI-powered analysis checks posts with photos X
          # doesn't mark sensitive & keeps scores of 0.5 or more. Only kept posts are
          # analyzed & cost 2 credits each. imageFilter states the cutoff & counts. Send
          # topic or imageShows, not both.
          image_shows: nil,
          # Analysis settings, the same as the analysis input of Xquik's AI Actors, plus
          # images. Leave it out for the route's own questions.
          analysis: nil,
          # Rows of an earlier answer to compare with, such as its results. Each needs the
          # post's id, or tweet.id, & its answers. Send monitor too, so other settings show
          # as not_comparable. Each result's monitor says whether the post is new, changed
          # or unchanged. The comparison costs nothing extra.
          baseline: nil,
          request_options: {}
        )
        end

        # Answers 1 to 8 questions you write in analysis.questions. A choice picks a
        # category, such as a topic. A score picks a level. A probability answers yes or
        # no. Without questions it answers the sentiment questions. Each analyzed post
        # costs 2 credits.
        sig do
          params(
            tweet_ids: T::Array[String],
            query: String,
            username: String,
            list_id: String,
            quotes_of: String,
            replies_to: String,
            queries: T::Array[String],
            usernames: T::Array[String],
            list_ids: T::Array[String],
            thread_of: String,
            replies_by: String,
            media_by: String,
            liked_by: String,
            since_time:
              XTwitterScraper::X::TweetAnalysisParams::SinceTime::Variants,
            until_time:
              XTwitterScraper::X::TweetAnalysisParams::UntilTime::Variants,
            query_type:
              XTwitterScraper::X::TweetAnalysisParams::QueryType::OrSymbol,
            limit: Integer,
            cursor: String,
            texts: T::Array[String],
            topic: String,
            image_shows: String,
            analysis: XTwitterScraper::X::TweetAnalysisParams::Analysis::OrHash,
            baseline:
              T::Array[
                XTwitterScraper::X::TweetAnalysisParams::Baseline::OrHash
              ],
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::TweetAnalysisPage)
        end
        def classify(
          # Post IDs or post URLs to analyze, up to 100.
          tweet_ids: nil,
          # X search to analyze, with the operators of /x/tweets/search, such as from:nasa
          # or lang:en. X searches up to 512 characters, counted with the other search
          # fields, as /x/tweets/search counts q.
          query: nil,
          # Analyze 1 account's posts. Send a handle, with or without @, or a profile URL.
          username: nil,
          # Analyze a public List's posts. Send its ID or URL.
          list_id: nil,
          # Analyze the quotes of 1 post. Send its ID or URL.
          quotes_of: nil,
          # Analyze the replies in 1 post's conversation. Send its ID or URL.
          replies_to: nil,
          # X searches to analyze as 1 search. A post matching any of them
          # counts. Each takes the operators of query. query, when sent, joins
          # them. X searches up to 512 characters, counted with the other search
          # fields.
          queries: nil,
          # Analyze the posts of several accounts in 1 search. Send handles,
          # with or without @, or profile URLs. username, when sent, joins them.
          usernames: nil,
          # Analyze the posts of several public Lists in 1 search. Send their
          # IDs or URLs. listId, when sent, joins them.
          list_ids: nil,
          # Analyze 1 post's thread, as /x/tweets/{id}/thread reads it. Send the
          # post's ID or URL. Send no other posts or search with it.
          thread_of: nil,
          # Analyze 1 account's posts & replies, as its Replies tab shows them.
          # /x/users/{id}/replies reads the same posts. Send a handle, with or
          # without @, a user ID or a profile URL. Send no other posts or search
          # with it.
          replies_by: nil,
          # Analyze 1 account's posts with photos or videos, as its Media tab
          # shows them. /x/users/{id}/media reads the same posts. Send a handle,
          # with or without @, a user ID or a profile URL. Send no other posts
          # or search with it.
          media_by: nil,
          # Analyze the posts 1 account liked, as /x/users/{id}/likes reads
          # them. Send a handle, with or without @, a user ID or a profile URL.
          # Send no other posts or search with it.
          liked_by: nil,
          # Inclusive start of the search, such as 2026-09-25T00:00:00Z. Unix seconds also
          # work. A time without an offset is UTC.
          since_time: nil,
          # Exclusive end of the search, such as 2026-09-26T00:00:00Z. Unix seconds also
          # work. A time without an offset is UTC.
          until_time: nil,
          # Search order. Default Latest.
          query_type: nil,
          # Maximum posts to analyze from the search. A low credit balance can return fewer.
          limit: nil,
          # The next_cursor of the page before. Send the same search with it.
          cursor: nil,
          # Your own texts to analyze, such as drafts. Reads nothing from X. Each text costs
          # the same as 1 analyzed post.
          texts: nil,
          # Keep only posts about this topic, the same as the Actors' topic input.
          # AI-powered analysis asks "Is this post about <topic>?" of each post & keeps
          # scores of 0.5 or more. Only kept posts are analyzed & cost 2 credits each, & a
          # post the filter drops costs nothing. topicFilter states the cutoff & counts.
          # Send topic or imageShows, not both.
          topic: nil,
          # Keep only posts whose photos show this, the same as the Actors' imageShows
          # input. Send charts, screenshots, product_photos, memes or people, or describe it
          # in words, such as a rocket. AI-powered analysis checks posts with photos X
          # doesn't mark sensitive & keeps scores of 0.5 or more. Only kept posts are
          # analyzed & cost 2 credits each. imageFilter states the cutoff & counts. Send
          # topic or imageShows, not both.
          image_shows: nil,
          # Analysis settings, the same as the analysis input of Xquik's AI Actors, plus
          # images. Leave it out for the route's own questions.
          analysis: nil,
          # Rows of an earlier answer to compare with, such as its results. Each needs the
          # post's id, or tweet.id, & its answers. Send monitor too, so other settings show
          # as not_comparable. Each result's monitor says whether the post is new, changed
          # or unchanged. The comparison costs nothing extra.
          baseline: nil,
          request_options: {}
        )
        end

        # Answers each post's stance on an asset, its content type, its conviction & its
        # relevance. The summary counts bullish & bearish posts per cashtag. Name the
        # asset in analysis.targets. Each analyzed post costs 2 credits.
        sig do
          params(
            tweet_ids: T::Array[String],
            query: String,
            username: String,
            list_id: String,
            quotes_of: String,
            replies_to: String,
            queries: T::Array[String],
            usernames: T::Array[String],
            list_ids: T::Array[String],
            thread_of: String,
            replies_by: String,
            media_by: String,
            liked_by: String,
            since_time:
              XTwitterScraper::X::TweetAnalysisParams::SinceTime::Variants,
            until_time:
              XTwitterScraper::X::TweetAnalysisParams::UntilTime::Variants,
            query_type:
              XTwitterScraper::X::TweetAnalysisParams::QueryType::OrSymbol,
            limit: Integer,
            cursor: String,
            texts: T::Array[String],
            topic: String,
            image_shows: String,
            analysis: XTwitterScraper::X::TweetAnalysisParams::Analysis::OrHash,
            baseline:
              T::Array[
                XTwitterScraper::X::TweetAnalysisParams::Baseline::OrHash
              ],
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::TweetAnalysisPage)
        end
        def market_signals(
          # Post IDs or post URLs to analyze, up to 100.
          tweet_ids: nil,
          # X search to analyze, with the operators of /x/tweets/search, such as from:nasa
          # or lang:en. X searches up to 512 characters, counted with the other search
          # fields, as /x/tweets/search counts q.
          query: nil,
          # Analyze 1 account's posts. Send a handle, with or without @, or a profile URL.
          username: nil,
          # Analyze a public List's posts. Send its ID or URL.
          list_id: nil,
          # Analyze the quotes of 1 post. Send its ID or URL.
          quotes_of: nil,
          # Analyze the replies in 1 post's conversation. Send its ID or URL.
          replies_to: nil,
          # X searches to analyze as 1 search. A post matching any of them
          # counts. Each takes the operators of query. query, when sent, joins
          # them. X searches up to 512 characters, counted with the other search
          # fields.
          queries: nil,
          # Analyze the posts of several accounts in 1 search. Send handles,
          # with or without @, or profile URLs. username, when sent, joins them.
          usernames: nil,
          # Analyze the posts of several public Lists in 1 search. Send their
          # IDs or URLs. listId, when sent, joins them.
          list_ids: nil,
          # Analyze 1 post's thread, as /x/tweets/{id}/thread reads it. Send the
          # post's ID or URL. Send no other posts or search with it.
          thread_of: nil,
          # Analyze 1 account's posts & replies, as its Replies tab shows them.
          # /x/users/{id}/replies reads the same posts. Send a handle, with or
          # without @, a user ID or a profile URL. Send no other posts or search
          # with it.
          replies_by: nil,
          # Analyze 1 account's posts with photos or videos, as its Media tab
          # shows them. /x/users/{id}/media reads the same posts. Send a handle,
          # with or without @, a user ID or a profile URL. Send no other posts
          # or search with it.
          media_by: nil,
          # Analyze the posts 1 account liked, as /x/users/{id}/likes reads
          # them. Send a handle, with or without @, a user ID or a profile URL.
          # Send no other posts or search with it.
          liked_by: nil,
          # Inclusive start of the search, such as 2026-09-25T00:00:00Z. Unix seconds also
          # work. A time without an offset is UTC.
          since_time: nil,
          # Exclusive end of the search, such as 2026-09-26T00:00:00Z. Unix seconds also
          # work. A time without an offset is UTC.
          until_time: nil,
          # Search order. Default Latest.
          query_type: nil,
          # Maximum posts to analyze from the search. A low credit balance can return fewer.
          limit: nil,
          # The next_cursor of the page before. Send the same search with it.
          cursor: nil,
          # Your own texts to analyze, such as drafts. Reads nothing from X. Each text costs
          # the same as 1 analyzed post.
          texts: nil,
          # Keep only posts about this topic, the same as the Actors' topic input.
          # AI-powered analysis asks "Is this post about <topic>?" of each post & keeps
          # scores of 0.5 or more. Only kept posts are analyzed & cost 2 credits each, & a
          # post the filter drops costs nothing. topicFilter states the cutoff & counts.
          # Send topic or imageShows, not both.
          topic: nil,
          # Keep only posts whose photos show this, the same as the Actors' imageShows
          # input. Send charts, screenshots, product_photos, memes or people, or describe it
          # in words, such as a rocket. AI-powered analysis checks posts with photos X
          # doesn't mark sensitive & keeps scores of 0.5 or more. Only kept posts are
          # analyzed & cost 2 credits each. imageFilter states the cutoff & counts. Send
          # topic or imageShows, not both.
          image_shows: nil,
          # Analysis settings, the same as the analysis input of Xquik's AI Actors, plus
          # images. Leave it out for the route's own questions.
          analysis: nil,
          # Rows of an earlier answer to compare with, such as its results. Each needs the
          # post's id, or tweet.id, & its answers. Send monitor too, so other settings show
          # as not_comparable. Each result's monitor says whether the post is new, changed
          # or unchanged. The comparison costs nothing extra.
          baseline: nil,
          request_options: {}
        )
        end

        # Answers each post's format, such as reporting, commentary or speculation, its
        # source attribution & its relevance to your topic. Name the topic in
        # analysis.targets. Each analyzed post costs 2 credits.
        sig do
          params(
            tweet_ids: T::Array[String],
            query: String,
            username: String,
            list_id: String,
            quotes_of: String,
            replies_to: String,
            queries: T::Array[String],
            usernames: T::Array[String],
            list_ids: T::Array[String],
            thread_of: String,
            replies_by: String,
            media_by: String,
            liked_by: String,
            since_time:
              XTwitterScraper::X::TweetAnalysisParams::SinceTime::Variants,
            until_time:
              XTwitterScraper::X::TweetAnalysisParams::UntilTime::Variants,
            query_type:
              XTwitterScraper::X::TweetAnalysisParams::QueryType::OrSymbol,
            limit: Integer,
            cursor: String,
            texts: T::Array[String],
            topic: String,
            image_shows: String,
            analysis: XTwitterScraper::X::TweetAnalysisParams::Analysis::OrHash,
            baseline:
              T::Array[
                XTwitterScraper::X::TweetAnalysisParams::Baseline::OrHash
              ],
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::TweetAnalysisPage)
        end
        def news(
          # Post IDs or post URLs to analyze, up to 100.
          tweet_ids: nil,
          # X search to analyze, with the operators of /x/tweets/search, such as from:nasa
          # or lang:en. X searches up to 512 characters, counted with the other search
          # fields, as /x/tweets/search counts q.
          query: nil,
          # Analyze 1 account's posts. Send a handle, with or without @, or a profile URL.
          username: nil,
          # Analyze a public List's posts. Send its ID or URL.
          list_id: nil,
          # Analyze the quotes of 1 post. Send its ID or URL.
          quotes_of: nil,
          # Analyze the replies in 1 post's conversation. Send its ID or URL.
          replies_to: nil,
          # X searches to analyze as 1 search. A post matching any of them
          # counts. Each takes the operators of query. query, when sent, joins
          # them. X searches up to 512 characters, counted with the other search
          # fields.
          queries: nil,
          # Analyze the posts of several accounts in 1 search. Send handles,
          # with or without @, or profile URLs. username, when sent, joins them.
          usernames: nil,
          # Analyze the posts of several public Lists in 1 search. Send their
          # IDs or URLs. listId, when sent, joins them.
          list_ids: nil,
          # Analyze 1 post's thread, as /x/tweets/{id}/thread reads it. Send the
          # post's ID or URL. Send no other posts or search with it.
          thread_of: nil,
          # Analyze 1 account's posts & replies, as its Replies tab shows them.
          # /x/users/{id}/replies reads the same posts. Send a handle, with or
          # without @, a user ID or a profile URL. Send no other posts or search
          # with it.
          replies_by: nil,
          # Analyze 1 account's posts with photos or videos, as its Media tab
          # shows them. /x/users/{id}/media reads the same posts. Send a handle,
          # with or without @, a user ID or a profile URL. Send no other posts
          # or search with it.
          media_by: nil,
          # Analyze the posts 1 account liked, as /x/users/{id}/likes reads
          # them. Send a handle, with or without @, a user ID or a profile URL.
          # Send no other posts or search with it.
          liked_by: nil,
          # Inclusive start of the search, such as 2026-09-25T00:00:00Z. Unix seconds also
          # work. A time without an offset is UTC.
          since_time: nil,
          # Exclusive end of the search, such as 2026-09-26T00:00:00Z. Unix seconds also
          # work. A time without an offset is UTC.
          until_time: nil,
          # Search order. Default Latest.
          query_type: nil,
          # Maximum posts to analyze from the search. A low credit balance can return fewer.
          limit: nil,
          # The next_cursor of the page before. Send the same search with it.
          cursor: nil,
          # Your own texts to analyze, such as drafts. Reads nothing from X. Each text costs
          # the same as 1 analyzed post.
          texts: nil,
          # Keep only posts about this topic, the same as the Actors' topic input.
          # AI-powered analysis asks "Is this post about <topic>?" of each post & keeps
          # scores of 0.5 or more. Only kept posts are analyzed & cost 2 credits each, & a
          # post the filter drops costs nothing. topicFilter states the cutoff & counts.
          # Send topic or imageShows, not both.
          topic: nil,
          # Keep only posts whose photos show this, the same as the Actors' imageShows
          # input. Send charts, screenshots, product_photos, memes or people, or describe it
          # in words, such as a rocket. AI-powered analysis checks posts with photos X
          # doesn't mark sensitive & keeps scores of 0.5 or more. Only kept posts are
          # analyzed & cost 2 credits each. imageFilter states the cutoff & counts. Send
          # topic or imageShows, not both.
          image_shows: nil,
          # Analysis settings, the same as the analysis input of Xquik's AI Actors, plus
          # images. Leave it out for the route's own questions.
          analysis: nil,
          # Rows of an earlier answer to compare with, such as its results. Each needs the
          # post's id, or tweet.id, & its answers. Send monitor too, so other settings show
          # as not_comparable. Each result's monitor says whether the post is new, changed
          # or unchanged. The comparison costs nothing extra.
          baseline: nil,
          request_options: {}
        )
        end

        # Answers each post's attitude, its intensity & its sarcasm probability. Sentiment
        # analysis names each post's main emotion, such as joy or anger. Send post IDs, an
        # X search, an account, a List, a post's replies or quotes, or your own texts.
        # Each analyzed post costs 2 credits. A post without an analysis costs nothing.
        sig do
          params(
            tweet_ids: T::Array[String],
            query: String,
            username: String,
            list_id: String,
            quotes_of: String,
            replies_to: String,
            queries: T::Array[String],
            usernames: T::Array[String],
            list_ids: T::Array[String],
            thread_of: String,
            replies_by: String,
            media_by: String,
            liked_by: String,
            since_time:
              XTwitterScraper::X::TweetAnalysisParams::SinceTime::Variants,
            until_time:
              XTwitterScraper::X::TweetAnalysisParams::UntilTime::Variants,
            query_type:
              XTwitterScraper::X::TweetAnalysisParams::QueryType::OrSymbol,
            limit: Integer,
            cursor: String,
            texts: T::Array[String],
            topic: String,
            image_shows: String,
            analysis: XTwitterScraper::X::TweetAnalysisParams::Analysis::OrHash,
            baseline:
              T::Array[
                XTwitterScraper::X::TweetAnalysisParams::Baseline::OrHash
              ],
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::TweetAnalysisPage)
        end
        def sentiment(
          # Post IDs or post URLs to analyze, up to 100.
          tweet_ids: nil,
          # X search to analyze, with the operators of /x/tweets/search, such as from:nasa
          # or lang:en. X searches up to 512 characters, counted with the other search
          # fields, as /x/tweets/search counts q.
          query: nil,
          # Analyze 1 account's posts. Send a handle, with or without @, or a profile URL.
          username: nil,
          # Analyze a public List's posts. Send its ID or URL.
          list_id: nil,
          # Analyze the quotes of 1 post. Send its ID or URL.
          quotes_of: nil,
          # Analyze the replies in 1 post's conversation. Send its ID or URL.
          replies_to: nil,
          # X searches to analyze as 1 search. A post matching any of them
          # counts. Each takes the operators of query. query, when sent, joins
          # them. X searches up to 512 characters, counted with the other search
          # fields.
          queries: nil,
          # Analyze the posts of several accounts in 1 search. Send handles,
          # with or without @, or profile URLs. username, when sent, joins them.
          usernames: nil,
          # Analyze the posts of several public Lists in 1 search. Send their
          # IDs or URLs. listId, when sent, joins them.
          list_ids: nil,
          # Analyze 1 post's thread, as /x/tweets/{id}/thread reads it. Send the
          # post's ID or URL. Send no other posts or search with it.
          thread_of: nil,
          # Analyze 1 account's posts & replies, as its Replies tab shows them.
          # /x/users/{id}/replies reads the same posts. Send a handle, with or
          # without @, a user ID or a profile URL. Send no other posts or search
          # with it.
          replies_by: nil,
          # Analyze 1 account's posts with photos or videos, as its Media tab
          # shows them. /x/users/{id}/media reads the same posts. Send a handle,
          # with or without @, a user ID or a profile URL. Send no other posts
          # or search with it.
          media_by: nil,
          # Analyze the posts 1 account liked, as /x/users/{id}/likes reads
          # them. Send a handle, with or without @, a user ID or a profile URL.
          # Send no other posts or search with it.
          liked_by: nil,
          # Inclusive start of the search, such as 2026-09-25T00:00:00Z. Unix seconds also
          # work. A time without an offset is UTC.
          since_time: nil,
          # Exclusive end of the search, such as 2026-09-26T00:00:00Z. Unix seconds also
          # work. A time without an offset is UTC.
          until_time: nil,
          # Search order. Default Latest.
          query_type: nil,
          # Maximum posts to analyze from the search. A low credit balance can return fewer.
          limit: nil,
          # The next_cursor of the page before. Send the same search with it.
          cursor: nil,
          # Your own texts to analyze, such as drafts. Reads nothing from X. Each text costs
          # the same as 1 analyzed post.
          texts: nil,
          # Keep only posts about this topic, the same as the Actors' topic input.
          # AI-powered analysis asks "Is this post about <topic>?" of each post & keeps
          # scores of 0.5 or more. Only kept posts are analyzed & cost 2 credits each, & a
          # post the filter drops costs nothing. topicFilter states the cutoff & counts.
          # Send topic or imageShows, not both.
          topic: nil,
          # Keep only posts whose photos show this, the same as the Actors' imageShows
          # input. Send charts, screenshots, product_photos, memes or people, or describe it
          # in words, such as a rocket. AI-powered analysis checks posts with photos X
          # doesn't mark sensitive & keeps scores of 0.5 or more. Only kept posts are
          # analyzed & cost 2 credits each. imageFilter states the cutoff & counts. Send
          # topic or imageShows, not both.
          image_shows: nil,
          # Analysis settings, the same as the analysis input of Xquik's AI Actors, plus
          # images. Leave it out for the route's own questions.
          analysis: nil,
          # Rows of an earlier answer to compare with, such as its results. Each needs the
          # post's id, or tweet.id, & its answers. Send monitor too, so other settings show
          # as not_comparable. Each result's monitor says whether the post is new, changed
          # or unchanged. The comparison costs nothing extra.
          baseline: nil,
          request_options: {}
        )
        end

        # Answers each post's hook, clarity, payoff, humor, spam risk & likely reaction, &
        # adds a Viral Score from 0 to 100 with a verdict. The score rates the wording. It
        # does not predict likes or views. Send drafts in texts to score them before
        # posting. Each analyzed post costs 2 credits. `viralAlgorithmScore` turns a
        # post's public counts into 1 comparable number.
        sig do
          params(
            tweet_ids: T::Array[String],
            query: String,
            username: String,
            list_id: String,
            quotes_of: String,
            replies_to: String,
            queries: T::Array[String],
            usernames: T::Array[String],
            list_ids: T::Array[String],
            thread_of: String,
            replies_by: String,
            media_by: String,
            liked_by: String,
            since_time:
              XTwitterScraper::X::TweetAnalysisParams::SinceTime::Variants,
            until_time:
              XTwitterScraper::X::TweetAnalysisParams::UntilTime::Variants,
            query_type:
              XTwitterScraper::X::TweetAnalysisParams::QueryType::OrSymbol,
            limit: Integer,
            cursor: String,
            texts: T::Array[String],
            topic: String,
            image_shows: String,
            analysis: XTwitterScraper::X::TweetAnalysisParams::Analysis::OrHash,
            baseline:
              T::Array[
                XTwitterScraper::X::TweetAnalysisParams::Baseline::OrHash
              ],
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::TweetAnalysisPage)
        end
        def viral_score(
          # Post IDs or post URLs to analyze, up to 100.
          tweet_ids: nil,
          # X search to analyze, with the operators of /x/tweets/search, such as from:nasa
          # or lang:en. X searches up to 512 characters, counted with the other search
          # fields, as /x/tweets/search counts q.
          query: nil,
          # Analyze 1 account's posts. Send a handle, with or without @, or a profile URL.
          username: nil,
          # Analyze a public List's posts. Send its ID or URL.
          list_id: nil,
          # Analyze the quotes of 1 post. Send its ID or URL.
          quotes_of: nil,
          # Analyze the replies in 1 post's conversation. Send its ID or URL.
          replies_to: nil,
          # X searches to analyze as 1 search. A post matching any of them
          # counts. Each takes the operators of query. query, when sent, joins
          # them. X searches up to 512 characters, counted with the other search
          # fields.
          queries: nil,
          # Analyze the posts of several accounts in 1 search. Send handles,
          # with or without @, or profile URLs. username, when sent, joins them.
          usernames: nil,
          # Analyze the posts of several public Lists in 1 search. Send their
          # IDs or URLs. listId, when sent, joins them.
          list_ids: nil,
          # Analyze 1 post's thread, as /x/tweets/{id}/thread reads it. Send the
          # post's ID or URL. Send no other posts or search with it.
          thread_of: nil,
          # Analyze 1 account's posts & replies, as its Replies tab shows them.
          # /x/users/{id}/replies reads the same posts. Send a handle, with or
          # without @, a user ID or a profile URL. Send no other posts or search
          # with it.
          replies_by: nil,
          # Analyze 1 account's posts with photos or videos, as its Media tab
          # shows them. /x/users/{id}/media reads the same posts. Send a handle,
          # with or without @, a user ID or a profile URL. Send no other posts
          # or search with it.
          media_by: nil,
          # Analyze the posts 1 account liked, as /x/users/{id}/likes reads
          # them. Send a handle, with or without @, a user ID or a profile URL.
          # Send no other posts or search with it.
          liked_by: nil,
          # Inclusive start of the search, such as 2026-09-25T00:00:00Z. Unix seconds also
          # work. A time without an offset is UTC.
          since_time: nil,
          # Exclusive end of the search, such as 2026-09-26T00:00:00Z. Unix seconds also
          # work. A time without an offset is UTC.
          until_time: nil,
          # Search order. Default Latest.
          query_type: nil,
          # Maximum posts to analyze from the search. A low credit balance can return fewer.
          limit: nil,
          # The next_cursor of the page before. Send the same search with it.
          cursor: nil,
          # Your own texts to analyze, such as drafts. Reads nothing from X. Each text costs
          # the same as 1 analyzed post.
          texts: nil,
          # Keep only posts about this topic, the same as the Actors' topic input.
          # AI-powered analysis asks "Is this post about <topic>?" of each post & keeps
          # scores of 0.5 or more. Only kept posts are analyzed & cost 2 credits each, & a
          # post the filter drops costs nothing. topicFilter states the cutoff & counts.
          # Send topic or imageShows, not both.
          topic: nil,
          # Keep only posts whose photos show this, the same as the Actors' imageShows
          # input. Send charts, screenshots, product_photos, memes or people, or describe it
          # in words, such as a rocket. AI-powered analysis checks posts with photos X
          # doesn't mark sensitive & keeps scores of 0.5 or more. Only kept posts are
          # analyzed & cost 2 credits each. imageFilter states the cutoff & counts. Send
          # topic or imageShows, not both.
          image_shows: nil,
          # Analysis settings, the same as the analysis input of Xquik's AI Actors, plus
          # images. Leave it out for the route's own questions.
          analysis: nil,
          # Rows of an earlier answer to compare with, such as its results. Each needs the
          # post's id, or tweet.id, & its answers. Send monitor too, so other settings show
          # as not_comparable. Each result's monitor says whether the post is new, changed
          # or unchanged. The comparison costs nothing extra.
          baseline: nil,
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
