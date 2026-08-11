# typed: strong

module XTwitterScraper
  module Resources
    class Support
      # Support ticket management
      class Attachments
        # Streams an authenticated user's support image or video. Video requests support
        # one standard byte range for seeking and resumable playback.
        sig do
          params(
            id: String,
            range: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(StringIO)
        end
        def download(
          # Support attachment public ID
          id,
          # Optional single byte range
          range: nil,
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
