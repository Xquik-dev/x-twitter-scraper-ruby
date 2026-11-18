# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class UserRetrieveFollowerAuditResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::UserRetrieveFollowerAuditResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Report on the followers read. Classes rest on public profile signals, so they
        # say what a profile looks like, never who runs it.
        sig { returns(XTwitterScraper::Models::FollowerAudit) }
        attr_reader :audit

        sig do
          params(audit: XTwitterScraper::Models::FollowerAudit::OrHash).void
        end
        attr_writer :audit

        sig do
          params(audit: XTwitterScraper::Models::FollowerAudit::OrHash).returns(
            T.attached_class
          )
        end
        def self.new(
          # Report on the followers read. Classes rest on public profile signals, so they
          # say what a profile looks like, never who runs it.
          audit:
        )
        end

        sig do
          override.returns({ audit: XTwitterScraper::Models::FollowerAudit })
        end
        def to_hash
        end
      end
    end
  end
end
