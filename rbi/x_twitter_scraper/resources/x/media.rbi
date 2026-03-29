# typed: strong

module XTwitterScraper
  module Resources
    class X
      # Media upload & download
      class Media
        # Upload media
        sig do
          params(
            account: String,
            file: XTwitterScraper::Internal::FileInput,
            is_long_video: T::Boolean,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::MediaCreateResponse)
        end
        def create(
          # X account (@username or account ID)
          account:,
          # Media file to upload
          file:,
          is_long_video: nil,
          request_options: {}
        )
        end

        # Download tweet media
        sig do
          params(
            tweet_ids: T::Array[String],
            tweet_input: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::MediaDownloadResponse)
        end
        def download(
          # Array of tweet URLs or IDs (bulk, max 50)
          tweet_ids: nil,
          # Tweet URL or ID (single tweet)
          tweet_input: nil,
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
