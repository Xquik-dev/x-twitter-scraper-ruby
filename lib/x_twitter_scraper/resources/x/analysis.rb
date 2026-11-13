# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      # AI analysis of posts, at 2 credits per analyzed post
      class Analysis
        # Answers whether each post is about your brand, the author's attitude toward it &
        # the author's relationship with it. Name the brand in analysis.targets. Each
        # analyzed post costs 2 credits.
        #
        # @overload brand(tweet_ids: nil, query: nil, username: nil, list_id: nil, quotes_of: nil, replies_to: nil, since_time: nil, until_time: nil, query_type: nil, limit: nil, cursor: nil, texts: nil, topic: nil, image_shows: nil, analysis: nil, baseline: nil, request_options: {})
        #
        # @param tweet_ids [Array<String>] Post IDs or post URLs to analyze, up to 100.
        #
        # @param query [String] X search to analyze, with the operators of /x/tweets/search, such as from:nasa
        #
        # @param username [String] Analyze 1 account's posts. Send a handle, with or without @, or a profile URL.
        #
        # @param list_id [String] Analyze a public List's posts. Send its ID or URL.
        #
        # @param quotes_of [String] Analyze the quotes of 1 post. Send its ID or URL.
        #
        # @param replies_to [String] Analyze the replies in 1 post's conversation. Send its ID or URL.
        #
        # @param since_time [String, Integer] Inclusive start of the search, such as 2026-09-25T00:00:00Z. Unix seconds also
        #
        # @param until_time [String, Integer] Exclusive end of the search, such as 2026-09-26T00:00:00Z. Unix seconds also
        #
        # @param query_type [Symbol, XTwitterScraper::Models::X::TweetAnalysisParams::QueryType] Search order. Default Latest.
        #
        # @param limit [Integer] Maximum posts to analyze from the search. A low credit balance can return fewer.
        #
        # @param cursor [String] The next_cursor of the page before. Send the same search with it.
        #
        # @param texts [Array<String>] Your own texts to analyze, such as drafts. Reads nothing from X. Each text costs
        #
        # @param topic [String] Keep only posts about this topic, the same as the Actors' topic input.
        #
        # @param image_shows [String] Keep only posts whose photos show this, the same as the Actors' imageShows
        #
        # @param analysis [XTwitterScraper::Models::X::TweetAnalysisParams::Analysis] Analysis settings, the same as the analysis input of Xquik's AI Actors, plus
        #
        # @param baseline [Array<XTwitterScraper::Models::X::TweetAnalysisParams::Baseline>] Rows of an earlier answer to compare with, such as its results. Each needs the
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::TweetAnalysisPage]
        #
        # @see XTwitterScraper::Models::X::TweetAnalysisParams
        def brand(params = {})
          parsed, options = XTwitterScraper::X::TweetAnalysisParams.dump_request(params)
          @client.request(
            method: :post,
            path: "x/analysis/brand",
            body: parsed,
            model: XTwitterScraper::TweetAnalysisPage,
            options: options
          )
        end

        # Answers 1 to 8 questions you write in analysis.questions. A choice picks a
        # category, such as a topic. A score picks a level. A probability answers yes or
        # no. Without questions it answers the sentiment questions. Each analyzed post
        # costs 2 credits.
        #
        # @overload classify(tweet_ids: nil, query: nil, username: nil, list_id: nil, quotes_of: nil, replies_to: nil, since_time: nil, until_time: nil, query_type: nil, limit: nil, cursor: nil, texts: nil, topic: nil, image_shows: nil, analysis: nil, baseline: nil, request_options: {})
        #
        # @param tweet_ids [Array<String>] Post IDs or post URLs to analyze, up to 100.
        #
        # @param query [String] X search to analyze, with the operators of /x/tweets/search, such as from:nasa
        #
        # @param username [String] Analyze 1 account's posts. Send a handle, with or without @, or a profile URL.
        #
        # @param list_id [String] Analyze a public List's posts. Send its ID or URL.
        #
        # @param quotes_of [String] Analyze the quotes of 1 post. Send its ID or URL.
        #
        # @param replies_to [String] Analyze the replies in 1 post's conversation. Send its ID or URL.
        #
        # @param since_time [String, Integer] Inclusive start of the search, such as 2026-09-25T00:00:00Z. Unix seconds also
        #
        # @param until_time [String, Integer] Exclusive end of the search, such as 2026-09-26T00:00:00Z. Unix seconds also
        #
        # @param query_type [Symbol, XTwitterScraper::Models::X::TweetAnalysisParams::QueryType] Search order. Default Latest.
        #
        # @param limit [Integer] Maximum posts to analyze from the search. A low credit balance can return fewer.
        #
        # @param cursor [String] The next_cursor of the page before. Send the same search with it.
        #
        # @param texts [Array<String>] Your own texts to analyze, such as drafts. Reads nothing from X. Each text costs
        #
        # @param topic [String] Keep only posts about this topic, the same as the Actors' topic input.
        #
        # @param image_shows [String] Keep only posts whose photos show this, the same as the Actors' imageShows
        #
        # @param analysis [XTwitterScraper::Models::X::TweetAnalysisParams::Analysis] Analysis settings, the same as the analysis input of Xquik's AI Actors, plus
        #
        # @param baseline [Array<XTwitterScraper::Models::X::TweetAnalysisParams::Baseline>] Rows of an earlier answer to compare with, such as its results. Each needs the
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::TweetAnalysisPage]
        #
        # @see XTwitterScraper::Models::X::TweetAnalysisParams
        def classify(params = {})
          parsed, options = XTwitterScraper::X::TweetAnalysisParams.dump_request(params)
          @client.request(
            method: :post,
            path: "x/analysis/classify",
            body: parsed,
            model: XTwitterScraper::TweetAnalysisPage,
            options: options
          )
        end

        # Answers each post's stance on an asset, its content type, its conviction & its
        # relevance. The summary counts bullish & bearish posts per cashtag. Name the
        # asset in analysis.targets. Each analyzed post costs 2 credits.
        #
        # @overload market_signals(tweet_ids: nil, query: nil, username: nil, list_id: nil, quotes_of: nil, replies_to: nil, since_time: nil, until_time: nil, query_type: nil, limit: nil, cursor: nil, texts: nil, topic: nil, image_shows: nil, analysis: nil, baseline: nil, request_options: {})
        #
        # @param tweet_ids [Array<String>] Post IDs or post URLs to analyze, up to 100.
        #
        # @param query [String] X search to analyze, with the operators of /x/tweets/search, such as from:nasa
        #
        # @param username [String] Analyze 1 account's posts. Send a handle, with or without @, or a profile URL.
        #
        # @param list_id [String] Analyze a public List's posts. Send its ID or URL.
        #
        # @param quotes_of [String] Analyze the quotes of 1 post. Send its ID or URL.
        #
        # @param replies_to [String] Analyze the replies in 1 post's conversation. Send its ID or URL.
        #
        # @param since_time [String, Integer] Inclusive start of the search, such as 2026-09-25T00:00:00Z. Unix seconds also
        #
        # @param until_time [String, Integer] Exclusive end of the search, such as 2026-09-26T00:00:00Z. Unix seconds also
        #
        # @param query_type [Symbol, XTwitterScraper::Models::X::TweetAnalysisParams::QueryType] Search order. Default Latest.
        #
        # @param limit [Integer] Maximum posts to analyze from the search. A low credit balance can return fewer.
        #
        # @param cursor [String] The next_cursor of the page before. Send the same search with it.
        #
        # @param texts [Array<String>] Your own texts to analyze, such as drafts. Reads nothing from X. Each text costs
        #
        # @param topic [String] Keep only posts about this topic, the same as the Actors' topic input.
        #
        # @param image_shows [String] Keep only posts whose photos show this, the same as the Actors' imageShows
        #
        # @param analysis [XTwitterScraper::Models::X::TweetAnalysisParams::Analysis] Analysis settings, the same as the analysis input of Xquik's AI Actors, plus
        #
        # @param baseline [Array<XTwitterScraper::Models::X::TweetAnalysisParams::Baseline>] Rows of an earlier answer to compare with, such as its results. Each needs the
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::TweetAnalysisPage]
        #
        # @see XTwitterScraper::Models::X::TweetAnalysisParams
        def market_signals(params = {})
          parsed, options = XTwitterScraper::X::TweetAnalysisParams.dump_request(params)
          @client.request(
            method: :post,
            path: "x/analysis/market-signals",
            body: parsed,
            model: XTwitterScraper::TweetAnalysisPage,
            options: options
          )
        end

        # Answers each post's format, such as reporting, commentary or speculation, its
        # source attribution & its relevance to your topic. Name the topic in
        # analysis.targets. Each analyzed post costs 2 credits.
        #
        # @overload news(tweet_ids: nil, query: nil, username: nil, list_id: nil, quotes_of: nil, replies_to: nil, since_time: nil, until_time: nil, query_type: nil, limit: nil, cursor: nil, texts: nil, topic: nil, image_shows: nil, analysis: nil, baseline: nil, request_options: {})
        #
        # @param tweet_ids [Array<String>] Post IDs or post URLs to analyze, up to 100.
        #
        # @param query [String] X search to analyze, with the operators of /x/tweets/search, such as from:nasa
        #
        # @param username [String] Analyze 1 account's posts. Send a handle, with or without @, or a profile URL.
        #
        # @param list_id [String] Analyze a public List's posts. Send its ID or URL.
        #
        # @param quotes_of [String] Analyze the quotes of 1 post. Send its ID or URL.
        #
        # @param replies_to [String] Analyze the replies in 1 post's conversation. Send its ID or URL.
        #
        # @param since_time [String, Integer] Inclusive start of the search, such as 2026-09-25T00:00:00Z. Unix seconds also
        #
        # @param until_time [String, Integer] Exclusive end of the search, such as 2026-09-26T00:00:00Z. Unix seconds also
        #
        # @param query_type [Symbol, XTwitterScraper::Models::X::TweetAnalysisParams::QueryType] Search order. Default Latest.
        #
        # @param limit [Integer] Maximum posts to analyze from the search. A low credit balance can return fewer.
        #
        # @param cursor [String] The next_cursor of the page before. Send the same search with it.
        #
        # @param texts [Array<String>] Your own texts to analyze, such as drafts. Reads nothing from X. Each text costs
        #
        # @param topic [String] Keep only posts about this topic, the same as the Actors' topic input.
        #
        # @param image_shows [String] Keep only posts whose photos show this, the same as the Actors' imageShows
        #
        # @param analysis [XTwitterScraper::Models::X::TweetAnalysisParams::Analysis] Analysis settings, the same as the analysis input of Xquik's AI Actors, plus
        #
        # @param baseline [Array<XTwitterScraper::Models::X::TweetAnalysisParams::Baseline>] Rows of an earlier answer to compare with, such as its results. Each needs the
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::TweetAnalysisPage]
        #
        # @see XTwitterScraper::Models::X::TweetAnalysisParams
        def news(params = {})
          parsed, options = XTwitterScraper::X::TweetAnalysisParams.dump_request(params)
          @client.request(
            method: :post,
            path: "x/analysis/news",
            body: parsed,
            model: XTwitterScraper::TweetAnalysisPage,
            options: options
          )
        end

        # Answers each post's attitude, its intensity & its sarcasm probability. Sentiment
        # analysis names each post's main emotion, such as joy or anger. Send post IDs, an
        # X search, an account, a List, a post's replies or quotes, or your own texts.
        # Each analyzed post costs 2 credits. A post without an analysis costs nothing.
        #
        # @overload sentiment(tweet_ids: nil, query: nil, username: nil, list_id: nil, quotes_of: nil, replies_to: nil, since_time: nil, until_time: nil, query_type: nil, limit: nil, cursor: nil, texts: nil, topic: nil, image_shows: nil, analysis: nil, baseline: nil, request_options: {})
        #
        # @param tweet_ids [Array<String>] Post IDs or post URLs to analyze, up to 100.
        #
        # @param query [String] X search to analyze, with the operators of /x/tweets/search, such as from:nasa
        #
        # @param username [String] Analyze 1 account's posts. Send a handle, with or without @, or a profile URL.
        #
        # @param list_id [String] Analyze a public List's posts. Send its ID or URL.
        #
        # @param quotes_of [String] Analyze the quotes of 1 post. Send its ID or URL.
        #
        # @param replies_to [String] Analyze the replies in 1 post's conversation. Send its ID or URL.
        #
        # @param since_time [String, Integer] Inclusive start of the search, such as 2026-09-25T00:00:00Z. Unix seconds also
        #
        # @param until_time [String, Integer] Exclusive end of the search, such as 2026-09-26T00:00:00Z. Unix seconds also
        #
        # @param query_type [Symbol, XTwitterScraper::Models::X::TweetAnalysisParams::QueryType] Search order. Default Latest.
        #
        # @param limit [Integer] Maximum posts to analyze from the search. A low credit balance can return fewer.
        #
        # @param cursor [String] The next_cursor of the page before. Send the same search with it.
        #
        # @param texts [Array<String>] Your own texts to analyze, such as drafts. Reads nothing from X. Each text costs
        #
        # @param topic [String] Keep only posts about this topic, the same as the Actors' topic input.
        #
        # @param image_shows [String] Keep only posts whose photos show this, the same as the Actors' imageShows
        #
        # @param analysis [XTwitterScraper::Models::X::TweetAnalysisParams::Analysis] Analysis settings, the same as the analysis input of Xquik's AI Actors, plus
        #
        # @param baseline [Array<XTwitterScraper::Models::X::TweetAnalysisParams::Baseline>] Rows of an earlier answer to compare with, such as its results. Each needs the
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::TweetAnalysisPage]
        #
        # @see XTwitterScraper::Models::X::TweetAnalysisParams
        def sentiment(params = {})
          parsed, options = XTwitterScraper::X::TweetAnalysisParams.dump_request(params)
          @client.request(
            method: :post,
            path: "x/analysis/sentiment",
            body: parsed,
            model: XTwitterScraper::TweetAnalysisPage,
            options: options
          )
        end

        # Answers each post's hook, clarity, payoff, humor, spam risk & likely reaction, &
        # adds a Viral Score from 0 to 100 with a verdict. The score rates the wording. It
        # does not predict likes or views. Send drafts in texts to score them before
        # posting. Each analyzed post costs 2 credits. `viralAlgorithmScore` turns a
        # post's public counts into 1 comparable number.
        #
        # @overload viral_score(tweet_ids: nil, query: nil, username: nil, list_id: nil, quotes_of: nil, replies_to: nil, since_time: nil, until_time: nil, query_type: nil, limit: nil, cursor: nil, texts: nil, topic: nil, image_shows: nil, analysis: nil, baseline: nil, request_options: {})
        #
        # @param tweet_ids [Array<String>] Post IDs or post URLs to analyze, up to 100.
        #
        # @param query [String] X search to analyze, with the operators of /x/tweets/search, such as from:nasa
        #
        # @param username [String] Analyze 1 account's posts. Send a handle, with or without @, or a profile URL.
        #
        # @param list_id [String] Analyze a public List's posts. Send its ID or URL.
        #
        # @param quotes_of [String] Analyze the quotes of 1 post. Send its ID or URL.
        #
        # @param replies_to [String] Analyze the replies in 1 post's conversation. Send its ID or URL.
        #
        # @param since_time [String, Integer] Inclusive start of the search, such as 2026-09-25T00:00:00Z. Unix seconds also
        #
        # @param until_time [String, Integer] Exclusive end of the search, such as 2026-09-26T00:00:00Z. Unix seconds also
        #
        # @param query_type [Symbol, XTwitterScraper::Models::X::TweetAnalysisParams::QueryType] Search order. Default Latest.
        #
        # @param limit [Integer] Maximum posts to analyze from the search. A low credit balance can return fewer.
        #
        # @param cursor [String] The next_cursor of the page before. Send the same search with it.
        #
        # @param texts [Array<String>] Your own texts to analyze, such as drafts. Reads nothing from X. Each text costs
        #
        # @param topic [String] Keep only posts about this topic, the same as the Actors' topic input.
        #
        # @param image_shows [String] Keep only posts whose photos show this, the same as the Actors' imageShows
        #
        # @param analysis [XTwitterScraper::Models::X::TweetAnalysisParams::Analysis] Analysis settings, the same as the analysis input of Xquik's AI Actors, plus
        #
        # @param baseline [Array<XTwitterScraper::Models::X::TweetAnalysisParams::Baseline>] Rows of an earlier answer to compare with, such as its results. Each needs the
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::TweetAnalysisPage]
        #
        # @see XTwitterScraper::Models::X::TweetAnalysisParams
        def viral_score(params = {})
          parsed, options = XTwitterScraper::X::TweetAnalysisParams.dump_request(params)
          @client.request(
            method: :post,
            path: "x/analysis/viral-score",
            body: parsed,
            model: XTwitterScraper::TweetAnalysisPage,
            options: options
          )
        end

        # @api private
        #
        # @param client [XTwitterScraper::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
