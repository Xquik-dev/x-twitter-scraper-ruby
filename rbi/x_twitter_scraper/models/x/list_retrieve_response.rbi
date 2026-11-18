# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class ListRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::ListRetrieveResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Public X List with its owner's public profile. It holds public fields only.
        sig { returns(XTwitterScraper::Models::XList) }
        attr_reader :list

        sig { params(list: XTwitterScraper::Models::XList::OrHash).void }
        attr_writer :list

        sig do
          params(list: XTwitterScraper::Models::XList::OrHash).returns(
            T.attached_class
          )
        end
        def self.new(
          # Public X List with its owner's public profile. It holds public fields only.
          list:
        )
        end

        sig { override.returns({ list: XTwitterScraper::Models::XList }) }
        def to_hash
        end
      end
    end
  end
end
