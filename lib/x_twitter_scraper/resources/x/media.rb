# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
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

        # Some parameter documentations has been truncated, see
        # {XTwitterScraper::Models::X::MediaUploadParams} for more details.
        #
        # Upload media
        #
        # @overload upload(account:, url:, idempotency_key:, request_options: {})
        #
        # @param account [String] Body param: X account (@username or ID) uploading media from URL
        #
        # @param url [String] Body param: HTTPS URL to download and upload as media
        #
        # @param idempotency_key [String] Header param: Generate one unique value for each intended write. Reuse it only w
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::MediaUploadResponse]
        #
        # @see XTwitterScraper::Models::X::MediaUploadParams
        def upload(params)
          parsed, options = XTwitterScraper::X::MediaUploadParams.dump_request(params)
          header_params = {idempotency_key: "idempotency-key"}
          @client.request(
            method: :post,
            path: "x/media",
            headers: {
              "content-type" => "multipart/form-data",
              **parsed.slice(*header_params.keys)
            }.transform_keys(
              header_params
            ),
            body: parsed.except(*header_params.keys),
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
