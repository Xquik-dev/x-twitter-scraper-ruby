# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class ProfileUpdateAvatarParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::ProfileUpdateAvatarParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # X account (@username or ID) receiving avatar from URL
        sig { returns(String) }
        attr_accessor :account

        # HTTPS URL to the avatar image to download
        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        sig { returns(String) }
        attr_accessor :idempotency_key

        # Avatar image (max 95 MiB)
        sig { returns(T.nilable(XTwitterScraper::Internal::FileInput)) }
        attr_reader :file

        sig { params(file: XTwitterScraper::Internal::FileInput).void }
        attr_writer :file

        sig do
          params(
            account: String,
            idempotency_key: String,
            file: XTwitterScraper::Internal::FileInput,
            url: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # X account (@username or ID) receiving avatar from URL
          account:,
          idempotency_key:,
          # Avatar image (max 95 MiB)
          file: nil,
          # HTTPS URL to the avatar image to download
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
