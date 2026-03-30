# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      # Media upload & download
      class Media
        # Download tweet media
        #
        # @overload download(tweet_ids: nil, tweet_input: nil, request_options: {})
        #
        # @param tweet_ids [Array<String>] Array of tweet URLs or IDs (bulk, max 50)
        #
        # @param tweet_input [String] Tweet URL or ID (single tweet)
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
        # @overload upload(account:, file:, is_long_video: nil, request_options: {})
        #
        # @param account [String] X account (@username or account ID)
        #
        # @param file [Pathname, StringIO, IO, String, XTwitterScraper::FilePart] Media file to upload
        #
        # @param is_long_video [Boolean]
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
