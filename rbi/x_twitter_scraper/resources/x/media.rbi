# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Media
        # Download images & videos from tweets
        sig do
          params(
            image_shows: String,
            tweet_id: String,
            tweet_ids: T::Array[String],
            tweet_input: String,
            tweet_url: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::MediaDownloadResponse)
        end
        def download(
          # Save only posts whose photos show this. Send charts, screenshots,
          # product_photos, memes or people, or describe it in words, such as a rocket.
          # AI-powered analysis checks posts with photos X doesn't mark sensitive & keeps
          # scores of 0.5 or more. Each post saved costs 2 credits, the AI analysis price,
          # on top of its save price, & a post the filter drops costs nothing. imageFilter
          # states the cutoff & counts.
          image_shows: nil,
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
            idempotency_key: String,
            file: XTwitterScraper::Internal::FileInput,
            is_long_video: T::Boolean,
            url: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::MediaUploadResponse)
        end
        def upload(
          # Body param: X account (@username or ID) uploading media from URL
          account:,
          # Header param: Generate one unique value for each intended write. Reuse it only
          # when retrying the exact same account, action, target, and payload. A reused key
          # returns the original action. Reusing it with different input returns 409. Replay
          # protection remains active for at least 90 days.
          idempotency_key:,
          # Media file to upload, up to 95 MB. A larger file gets 413 `media_too_large`
          # before any account lookup.
          file: nil,
          # Set true only for video/mp4 multipart uploads longer than 140 seconds.
          is_long_video: nil,
          # Body param: HTTPS URL to download and upload as media
          url: nil,
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
