# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class FollowerCheckResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::FollowerCheckResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T::Boolean) }
        attr_accessor :is_followed_by

        sig { returns(T::Boolean) }
        attr_accessor :is_following

        sig { returns(String) }
        attr_accessor :source_username

        sig { returns(String) }
        attr_accessor :target_username

        # The source account's user ID, as X gives it.
        sig { returns(T.nilable(String)) }
        attr_reader :source_id

        sig { params(source_id: String).void }
        attr_writer :source_id

        # The target account's user ID, as X gives it.
        sig { returns(T.nilable(String)) }
        attr_reader :target_id

        sig { params(target_id: String).void }
        attr_writer :target_id

        sig do
          params(
            is_followed_by: T::Boolean,
            is_following: T::Boolean,
            source_username: String,
            target_username: String,
            source_id: String,
            target_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          is_followed_by:,
          is_following:,
          source_username:,
          target_username:,
          # The source account's user ID, as X gives it.
          source_id: nil,
          # The target account's user ID, as X gives it.
          target_id: nil
        )
        end

        sig do
          override.returns(
            {
              is_followed_by: T::Boolean,
              is_following: T::Boolean,
              source_username: String,
              target_username: String,
              source_id: String,
              target_id: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
