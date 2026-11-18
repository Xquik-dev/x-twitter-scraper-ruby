# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module Monitors
      class PostRetrieveMetricsParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::Monitors::PostRetrieveMetricsParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Resource ID returned by the matching create or list endpoint.
        sig { returns(String) }
        attr_accessor :id

        # Hours to return, from 1 to 17,520.
        sig { returns(T.nilable(Integer)) }
        attr_reader :hours

        sig { params(hours: Integer).void }
        attr_writer :hours

        sig do
          params(
            id: String,
            hours: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Resource ID returned by the matching create or list endpoint.
          id:,
          # Hours to return, from 1 to 17,520.
          hours: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              id: String,
              hours: Integer,
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
