# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Media#download
      class MediaDownloadParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute image_shows
        #   Save only posts whose photos show this. Send charts, screenshots,
        #   product_photos, memes or people, or describe it in words, such as a rocket.
        #   AI-powered analysis checks posts with photos X doesn't mark sensitive & keeps
        #   scores of 0.5 or more. Each post saved costs 2 credits, the AI analysis price,
        #   on top of its save price, & a post the filter drops costs nothing. imageFilter
        #   states the cutoff & counts.
        #
        #   @return [String, nil]
        optional :image_shows, String, api_name: :imageShows

        # @!attribute tweet_id
        #   Numeric tweet ID alias for tweetInput
        #
        #   @return [String, nil]
        optional :tweet_id, String, api_name: :tweetId

        # @!attribute tweet_ids
        #   Array of tweet URLs or IDs (bulk, max 50 string items)
        #
        #   @return [Array<String>, nil]
        optional :tweet_ids, XTwitterScraper::Internal::Type::ArrayOf[String], api_name: :tweetIds

        # @!attribute tweet_input
        #   Tweet URL or ID (single tweet)
        #
        #   @return [String, nil]
        optional :tweet_input, String, api_name: :tweetInput

        # @!attribute tweet_url
        #   Tweet URL alias for tweetInput
        #
        #   @return [String, nil]
        optional :tweet_url, String, api_name: :tweetUrl

        # @!method initialize(image_shows: nil, tweet_id: nil, tweet_ids: nil, tweet_input: nil, tweet_url: nil, request_options: {})
        #   @param image_shows [String] Save only posts whose photos show this. Send charts, screenshots, product_photos
        #
        #   @param tweet_id [String] Numeric tweet ID alias for tweetInput
        #
        #   @param tweet_ids [Array<String>] Array of tweet URLs or IDs (bulk, max 50 string items)
        #
        #   @param tweet_input [String] Tweet URL or ID (single tweet)
        #
        #   @param tweet_url [String] Tweet URL alias for tweetInput
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
