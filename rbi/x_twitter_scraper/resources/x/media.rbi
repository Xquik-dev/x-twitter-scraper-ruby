# typed: strong

module XTwitterScraper
  module Resources
    class X
      # Media upload and download
      class Media
        # Download images & videos from tweets
        sig do
          params(
            tweet_id: String,
            tweet_ids: T::Array[String],
            tweet_input: String,
            tweet_url: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::MediaDownloadResponse)
        end
        def download(
          # Numeric tweet ID alias for tweetInput
          tweet_id: nil,
          # Array of tweet URLs or IDs (bulk, max 50 string items)
          tweet_ids: nil,
          # Tweet URL or ID (single tweet)
          tweet_input: nil,
          # Tweet URL alias for tweetInput
          tweet_url: nil,
          request_options: {}
        )
        end

        # Upload media
        sig do
          params(
            account: String,
            url: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::MediaUploadResponse)
        end
        def upload(
          # X account (@username or ID) uploading media from URL
          account:,
          # HTTPS URL to download and upload as media
          url:,
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
