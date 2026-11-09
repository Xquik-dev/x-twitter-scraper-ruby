# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module Support
      class TicketReplyParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Support::TicketReplyParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(T.nilable(String)) }
        attr_reader :body

        sig { params(body: String).void }
        attr_writer :body

        # 1 to 4 support image or video uploads.
        sig do
          returns(T.nilable(T::Array[XTwitterScraper::Internal::FileInput]))
        end
        attr_reader :attachments

        sig do
          params(
            attachments: T::Array[XTwitterScraper::Internal::FileInput]
          ).void
        end
        attr_writer :attachments

        sig { returns(T.nilable(String)) }
        attr_reader :idempotency_key

        sig { params(idempotency_key: String).void }
        attr_writer :idempotency_key

        sig do
          params(
            id: String,
            attachments: T::Array[XTwitterScraper::Internal::FileInput],
            body: String,
            idempotency_key: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # 1 to 4 support image or video uploads.
          attachments: nil,
          body: nil,
          idempotency_key: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              id: String,
              body: String,
              attachments: T::Array[XTwitterScraper::Internal::FileInput],
              idempotency_key: String,
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
