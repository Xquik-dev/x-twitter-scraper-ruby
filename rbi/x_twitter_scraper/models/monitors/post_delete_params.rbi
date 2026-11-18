# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module Monitors
      class PostDeleteParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::Monitors::PostDeleteParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Resource ID returned by the matching create or list endpoint.
        sig { returns(String) }
        attr_accessor :id

        sig do
          params(
            id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Resource ID returned by the matching create or list endpoint.
          id:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            { id: String, request_options: XTwitterScraper::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
