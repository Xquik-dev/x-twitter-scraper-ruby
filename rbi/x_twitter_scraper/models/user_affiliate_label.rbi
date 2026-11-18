# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class UserAffiliateLabel < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::UserAffiliateLabel,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # More labels X shows beside the affiliation, such as an automated account's
      # owner.
      sig do
        returns(
          T.nilable(T::Array[XTwitterScraper::Models::UserAuxiliaryLabel])
        )
      end
      attr_reader :auxiliary_labels

      sig do
        params(
          auxiliary_labels:
            T::Array[XTwitterScraper::Models::UserAuxiliaryLabel::OrHash]
        ).void
      end
      attr_writer :auxiliary_labels

      sig { returns(T.nilable(String)) }
      attr_reader :badge_url

      sig { params(badge_url: String).void }
      attr_writer :badge_url

      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # Public text, ranges, references, and mention data.
      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :long_description

      sig { params(long_description: T::Hash[Symbol, T.anything]).void }
      attr_writer :long_description

      sig { returns(T.nilable(String)) }
      attr_reader :url

      sig { params(url: String).void }
      attr_writer :url

      sig { returns(T.nilable(String)) }
      attr_reader :url_type

      sig { params(url_type: String).void }
      attr_writer :url_type

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
          auxiliary_labels:
            T::Array[XTwitterScraper::Models::UserAuxiliaryLabel::OrHash],
          badge_url: String,
          description: String,
          long_description: T::Hash[Symbol, T.anything],
          url: String,
          url_type: String,
          user_label_display_type: String,
          user_label_type: String
        ).returns(T.attached_class)
      end
      def self.new(
        # More labels X shows beside the affiliation, such as an automated account's
        # owner.
        auxiliary_labels: nil,
        badge_url: nil,
        description: nil,
        # Public text, ranges, references, and mention data.
        long_description: nil,
        url: nil,
        url_type: nil,
        user_label_display_type: nil,
        user_label_type: nil
      )
      end

      sig do
        override.returns(
          {
            auxiliary_labels:
              T::Array[XTwitterScraper::Models::UserAuxiliaryLabel],
            badge_url: String,
            description: String,
            long_description: T::Hash[Symbol, T.anything],
            url: String,
            url_type: String,
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
