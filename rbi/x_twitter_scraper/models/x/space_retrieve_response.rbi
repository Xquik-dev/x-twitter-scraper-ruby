# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class SpaceRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::SpaceRetrieveResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # X Space
        sig { returns(XTwitterScraper::Models::Space) }
        attr_reader :space

        sig { params(space: XTwitterScraper::Models::Space::OrHash).void }
        attr_writer :space

        sig do
          params(space: XTwitterScraper::Models::Space::OrHash).returns(
            T.attached_class
          )
        end
        def self.new(
          # X Space
          space:
        )
        end

        sig { override.returns({ space: XTwitterScraper::Models::Space }) }
        def to_hash
        end
      end
    end
  end
end
