# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class Support
      # Support ticket management
      class Attachments
        # Streams an authenticated user's support image or video. Video requests support
        # one standard byte range for seeking and resumable playback.
        #
        # @overload download(id, range: nil, request_options: {})
        #
        # @param id [String] Support attachment public ID
        #
        # @param range [String] Optional single byte range
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [StringIO]
        #
        # @see XTwitterScraper::Models::Support::AttachmentDownloadParams
        def download(id, params = {})
          parsed, options = XTwitterScraper::Support::AttachmentDownloadParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["support/attachments/%1$s", id],
            headers: {"accept" => "application/octet-stream", **parsed}.transform_keys(range: "range"),
            model: StringIO,
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
