# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      # Media upload and download
      class Media
        # Download images and videos from tweets
        #
        # @overload download(tweet_id: nil, tweet_ids: nil, tweet_input: nil, tweet_url: nil, request_options: {})
        #
        # @param tweet_id [String] Numeric tweet ID alias for tweetInput
        #
        # @param tweet_ids [Array<String>] Array of tweet URLs or IDs (bulk, max 50 string items)
        #
        # @param tweet_input [String] Tweet URL or ID (single tweet)
        #
        # @param tweet_url [String] Tweet URL alias for tweetInput
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::MediaDownloadResponse]
        #
        # @see XTwitterScraper::Models::X::MediaDownloadParams
        def download(params = {})
          parsed, options = XTwitterScraper::X::MediaDownloadParams.dump_request(params)
          @client.request(
            method: :post,
            path: "x/media/download",
            body: parsed,
            model: XTwitterScraper::Models::X::MediaDownloadResponse,
            options: options
          )
        end

        # Upload media
        #
        # @overload upload(account:, url:, request_options: {})
        #
        # @param account [String] X account (@username or ID) uploading media from URL
        #
        # @param url [String] HTTPS URL to download and upload as media
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::MediaUploadResponse]
        #
        # @see XTwitterScraper::Models::X::MediaUploadParams
        def upload(params)
          parsed, options = XTwitterScraper::X::MediaUploadParams.dump_request(params)
          @client.request(
            method: :post,
            path: "x/media",
            headers: {"content-type" => "multipart/form-data"},
            body: parsed,
            model: XTwitterScraper::Models::X::MediaUploadResponse,
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
