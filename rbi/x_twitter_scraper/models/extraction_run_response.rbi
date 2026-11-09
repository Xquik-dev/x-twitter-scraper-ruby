# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class ExtractionRunResponse < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::ExtractionRunResponse,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :allowed

      sig { params(allowed: T::Boolean).void }
      attr_writer :allowed

      sig { returns(T.nilable(String)) }
      attr_reader :credits_available

      sig { params(credits_available: String).void }
      attr_writer :credits_available

      sig { returns(T.nilable(String)) }
      attr_reader :credits_required

      sig { params(credits_required: String).void }
      attr_writer :credits_required

      sig { returns(T.nilable(Integer)) }
      attr_reader :estimated_results

      sig { params(estimated_results: Integer).void }
      attr_writer :estimated_results

      sig { returns(T.nilable(String)) }
      attr_reader :source

      sig { params(source: String).void }
      attr_writer :source

      sig { returns(T.nilable(String)) }
      attr_reader :resolved_x_user_id

      sig { params(resolved_x_user_id: String).void }
      attr_writer :resolved_x_user_id

      sig do
        params(
          allowed: T::Boolean,
          credits_available: String,
          credits_required: String,
          estimated_results: Integer,
          source: String,
          resolved_x_user_id: String
        ).returns(T.attached_class)
      end
      def self.new(
        allowed: nil,
        credits_available: nil,
        credits_required: nil,
        estimated_results: nil,
        source: nil,
        resolved_x_user_id: nil
      )
      end

      sig do
        override.returns(
          {
            allowed: T::Boolean,
            credits_available: String,
            credits_required: String,
            estimated_results: Integer,
            source: String,
            resolved_x_user_id: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
