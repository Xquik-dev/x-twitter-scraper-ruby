# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class MediaUploadParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::MediaUploadParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # X account (@username or ID) uploading media from URL
        sig { returns(String) }
        attr_accessor :account

        # HTTPS URL to download and upload as media
        sig { returns(String) }
        attr_accessor :url

        sig { returns(String) }
        attr_accessor :idempotency_key

        # Set true only for video/mp4 multipart uploads longer than 140 seconds.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_long_video

        sig { params(is_long_video: T::Boolean).void }
        attr_writer :is_long_video

        sig do
          params(
            account: String,
            url: String,
            idempotency_key: String,
            is_long_video: T::Boolean,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # X account (@username or ID) uploading media from URL
          account:,
          # HTTPS URL to download and upload as media
          url:,
          idempotency_key:,
          # Set true only for video/mp4 multipart uploads longer than 140 seconds.
          is_long_video: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              account: String,
              url: String,
              idempotency_key: String,
              is_long_video: T::Boolean,
              request_options: XTwitterScraper::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
