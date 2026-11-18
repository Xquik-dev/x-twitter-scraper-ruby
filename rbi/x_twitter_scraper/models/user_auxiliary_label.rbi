# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class UserAuxiliaryLabel < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::UserAuxiliaryLabel,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(T.nilable(String)) }
      attr_reader :badge_url

      sig { params(badge_url: String).void }
      attr_writer :badge_url

      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      sig { returns(T.nilable(String)) }
      attr_reader :user_label_display_type

      sig { params(user_label_display_type: String).void }
      attr_writer :user_label_display_type

      sig { returns(T.nilable(String)) }
      attr_reader :user_label_type

      sig { params(user_label_type: String).void }
      attr_writer :user_label_type

      sig do
        params(
          badge_url: String,
          description: String,
          url: String,
          user_label_display_type: String,
          user_label_type: String
        ).returns(T.attached_class)
      end
      def self.new(
        badge_url: nil,
        description: nil,
        url: nil,
        user_label_display_type: nil,
        user_label_type: nil
      )
      end

      sig do
        override.returns(
          {
            badge_url: String,
            description: String,
            url: String,
            user_label_display_type: String,
            user_label_type: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
