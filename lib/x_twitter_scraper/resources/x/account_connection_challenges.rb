# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      # Connected X account management
      class AccountConnectionChallenges
        # Submit X account email verification code
        #
        # @overload submit(id, email_code:, request_options: {})
        #
        # @param id [String] Resource ID returned by the matching create or list endpoint.
        #
        # @param email_code [String] Code sent to the account email.
        #
        # @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse]
        #
        # @see XTwitterScraper::Models::X::AccountConnectionChallengeSubmitParams
        def submit(id, params)
          parsed, options = XTwitterScraper::X::AccountConnectionChallengeSubmitParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["x/account-connection-challenges/%1$s/submit", id],
            body: parsed,
            model: XTwitterScraper::Models::X::AccountConnectionChallengeSubmitResponse,
            options: options
          )
        end

        # @api private
        #
        # @param client [XTwitterScraper::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end
