# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class UserIdentityVerification < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::UserIdentityVerification,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Whether the owner verified their ID with X.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_identity_verified

      sig { params(is_identity_verified: T::Boolean).void }
      attr_writer :is_identity_verified

      # The year X shows as the start of verification, in place of verifiedSinceMsec.
      sig { returns(T.nilable(Integer)) }
      attr_reader :override_verified_year

      sig { params(override_verified_year: Integer).void }
      attr_writer :override_verified_year

      # When X verified the account, in milliseconds since 1970, as text.
      sig { returns(T.nilable(String)) }
      attr_reader :verified_since_msec

      sig { params(verified_since_msec: String).void }
      attr_writer :verified_since_msec

      sig do
        params(
          description: String,
          is_identity_verified: T::Boolean,
          override_verified_year: Integer,
          verified_since_msec: String
        ).returns(T.attached_class)
      end
      def self.new(
        description: nil,
        # Whether the owner verified their ID with X.
        is_identity_verified: nil,
        # The year X shows as the start of verification, in place of verifiedSinceMsec.
        override_verified_year: nil,
        # When X verified the account, in milliseconds since 1970, as text.
        verified_since_msec: nil
      )
      end

      sig do
        override.returns(
          {
            description: String,
            is_identity_verified: T::Boolean,
            override_verified_year: Integer,
            verified_since_msec: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
