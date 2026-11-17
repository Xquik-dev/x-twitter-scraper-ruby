# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Resources
    class X
      # Connected X account management
      class AccountConnectionLinks
        # Creates a link to a page Xquik hosts, where a person connects an X account with
        # no Xquik signup. Send `account_id` to reconnect 1 of your accounts instead. The
        # link works for 30 minutes, and this response is the only place its token
        # appears. Takes a Full access API key holding `connectsXAccounts`.
        sig do
          params(
            reference: String,
            return_url: String,
            account_id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::AccountConnectionLinkCreateResponse)
        end
        def create(
          # Your own ID for this person. It comes back when you read the link.
          reference: nil,
          # A public https URL the page offers as a button once the account connects. Xquik
          # never redirects by itself, and never adds the token.
          return_url: nil,
          # The ID of 1 of your X accounts. The link then reconnects that account.
          account_id: nil,
          request_options: {}
        )
        end

        # Reads what happened on a link. `status` reads `connected` once the person
        # finishes, with `x_user_id`, `x_username` and `health`. It never holds the token. Takes a Full access API key holding `connectsXAccounts`.
        sig do
          params(
            id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::X::XAccountConnectionLink)
        end
        def retrieve(
          # Connect link ID returned when you created the link.
          id,
          request_options: {}
        )
        end

        # Stops a link working. An account it already connected stays connected. Takes a Full access API key holding `connectsXAccounts`.
        sig do
          params(
            id: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::AccountConnectionLinkRevokeResponse)
        end
        def revoke(
          # Connect link ID returned when you created the link.
          id,
          request_options: {}
        )
        end

        # Lists your connect links, newest first, with `api_key_id` naming the API key that
        # made each one, or nil for a dashboard session. Use it to find and revoke the
        # links a leaked key made. It never holds a token. Takes a Full access API key holding `connectsXAccounts`.
        sig do
          params(
            cursor: String,
            limit: Integer,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(XTwitterScraper::Models::X::AccountConnectionLinkListResponse)
        end
        def list(
          # Previous nextCursor. The after alias also works. Offset pagination is not
          # supported.
          cursor: nil,
          # Maximum items per page, from 1 to 10,000. Default 200. Pass nextCursor as
          # cursor for the next page.
          limit: nil,
          request_options: {}
        )
        end

        # @api private
        sig do
          params(client: XTwitterScraper::Client).returns(T.attached_class)
        end
        def self.new(client:)
        end
      end
    end
  end
end
