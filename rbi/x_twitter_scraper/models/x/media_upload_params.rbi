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
        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        sig { returns(String) }
        attr_accessor :idempotency_key

        # Media file to upload, up to 95 MB. A larger file gets 413 `media_too_large`
        # before any account lookup.
        sig { returns(T.nilable(XTwitterScraper::Internal::FileInput)) }
        attr_reader :file

        sig { params(file: XTwitterScraper::Internal::FileInput).void }
        attr_writer :file

        # Set true only for video/mp4 multipart uploads longer than 140 seconds.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_long_video

        sig { params(is_long_video: T::Boolean).void }
        attr_writer :is_long_video

        sig do
          params(
            account: String,
            idempotency_key: String,
            file: XTwitterScraper::Internal::FileInput,
            is_long_video: T::Boolean,
            url: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # X account (@username or ID) uploading media from URL
          account:,
          idempotency_key:,
          # Media file to upload, up to 95 MB. A larger file gets 413 `media_too_large`
          # before any account lookup.
          file: nil,
          # Set true only for video/mp4 multipart uploads longer than 140 seconds.
          is_long_video: nil,
          # HTTPS URL to download and upload as media
          url: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              account: String,
              url: String,
              idempotency_key: String,
              file: XTwitterScraper::Internal::FileInput,
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
