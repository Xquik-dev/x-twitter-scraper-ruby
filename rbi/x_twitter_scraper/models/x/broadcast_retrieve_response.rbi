# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class BroadcastRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::BroadcastRetrieveResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # X broadcast, a live video
        sig { returns(XTwitterScraper::Models::Broadcast) }
        attr_reader :broadcast

        sig do
          params(broadcast: XTwitterScraper::Models::Broadcast::OrHash).void
        end
        attr_writer :broadcast

        sig do
          params(broadcast: XTwitterScraper::Models::Broadcast::OrHash).returns(
            T.attached_class
          )
        end
        def self.new(
          # X broadcast, a live video
          broadcast:
        )
        end

        sig do
          override.returns({ broadcast: XTwitterScraper::Models::Broadcast })
        end
        def to_hash
        end
      end
    end
  end
end
