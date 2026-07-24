# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class FollowerCheckParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::FollowerCheckParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Source username, @username, or X or Twitter profile URL
        sig { returns(String) }
        attr_accessor :source

        # Target username, @username, or X or Twitter profile URL
        sig { returns(String) }
        attr_accessor :target

        sig do
          params(
            source: String,
            target: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Source username, @username, or X or Twitter profile URL
          source:,
          # Target username, @username, or X or Twitter profile URL
          target:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              source: String,
              target: String,
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
