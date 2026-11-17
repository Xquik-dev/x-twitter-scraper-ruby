# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class AccountConnectionLinkCreateResponse < XTwitterScraper::Models::X::XAccountConnectionLink
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::AccountConnectionLinkCreateResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # The page to open. Its fragment holds the token, so treat it as a secret and keep
        # it out of logs.
        sig { returns(String) }
        attr_accessor :url

        # A new connect link and the only copy of its page URL.
        sig { params(url: String).returns(T.attached_class) }
        def self.new(
          # The page to open. Its fragment holds the token, so treat it as a secret and keep
          # it out of logs.
          url:
        )
        end

        sig { override.returns({ url: String }) }
        def to_hash
        end
      end
    end
  end
end
