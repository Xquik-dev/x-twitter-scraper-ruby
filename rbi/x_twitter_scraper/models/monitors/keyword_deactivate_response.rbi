# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module Monitors
      class KeywordDeactivateResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::Monitors::KeywordDeactivateResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :deletion_status

        # Poll this monitor URL until it returns 404.
        sig { returns(String) }
        attr_accessor :status_url

        sig { returns(T::Boolean) }
        attr_accessor :success

        sig do
          params(
            deletion_status: Symbol,
            status_url: String,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          deletion_status: :deleting,
          # Poll this monitor URL until it returns 404.
          status_url:,
          success: true
        )
        end

        sig do
          override.returns(
            { deletion_status: Symbol, status_url: String, success: T::Boolean }
          )
        end
        def to_hash
        end
      end
    end
  end
end
