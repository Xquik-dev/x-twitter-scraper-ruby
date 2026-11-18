# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class UserLiveStatus < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::UserLiveStatus,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # True while the user's latest broadcast is running.
      sig { returns(T::Boolean) }
      attr_accessor :live

      # Latest broadcast, live or ended. Null when X shows none. Holds only its ID &
      # state when X can't read it in full.
      sig { returns(T.nilable(XTwitterScraper::Models::Broadcast)) }
      attr_reader :broadcast

      sig do
        params(
          broadcast: T.nilable(XTwitterScraper::Models::Broadcast::OrHash)
        ).void
      end
      attr_writer :broadcast

      # ID of the user.
      sig { returns(String) }
      attr_accessor :user_id

      # Username of the user.
      sig { returns(String) }
      attr_accessor :user_name

      sig do
        params(
          live: T::Boolean,
          broadcast: T.nilable(XTwitterScraper::Models::Broadcast::OrHash),
          user_id: String,
          user_name: String
        ).returns(T.attached_class)
      end
      def self.new(
        # True while the user's latest broadcast is running.
        live:,
        # Latest broadcast, live or ended. Null when X shows none. Holds only its ID &
        # state when X can't read it in full.
        broadcast:,
        # ID of the user.
        user_id:,
        # Username of the user.
        user_name:
      )
      end

      sig do
        override.returns(
          {
            live: T::Boolean,
            broadcast: T.nilable(XTwitterScraper::Models::Broadcast),
            user_id: String,
            user_name: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
