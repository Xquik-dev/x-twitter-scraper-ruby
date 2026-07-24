# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class BookmarkRetrieveFoldersParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::BookmarkRetrieveFoldersParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig do
          params(
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(request_options: {})
        end

        sig do
          override.returns({ request_options: XTwitterScraper::RequestOptions })
        end
        def to_hash
        end
      end
    end
  end
end
