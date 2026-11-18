# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Users#retrieve_follower_audit
      class UserRetrieveFollowerAuditResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute audit
        #   Report on the followers read. Classes rest on public profile signals, so they
        #   say what a profile looks like, never who runs it.
        #
        #   @return [XTwitterScraper::Models::FollowerAudit]
        required :audit, -> { XTwitterScraper::Models::FollowerAudit }

        # @!method initialize(audit:)
        #   @param audit [XTwitterScraper::Models::FollowerAudit] Report on the followers read. Classes rest on public profile signals, so they say what a profile looks like, never who runs it.
      end
    end
  end
end
