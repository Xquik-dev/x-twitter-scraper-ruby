# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class DraftCreateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::DraftCreateParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :text

      sig do
        returns(T.nilable(XTwitterScraper::DraftCreateParams::Goal::OrSymbol))
      end
      attr_reader :goal

      sig do
        params(goal: XTwitterScraper::DraftCreateParams::Goal::OrSymbol).void
      end
      attr_writer :goal

      sig { returns(T.nilable(String)) }
      attr_reader :topic

      sig { params(topic: String).void }
      attr_writer :topic

      sig do
        params(
          text: String,
          goal: XTwitterScraper::DraftCreateParams::Goal::OrSymbol,
          topic: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(text:, goal: nil, topic: nil, request_options: {})
      end

      sig do
        override.returns(
          {
            text: String,
            goal: XTwitterScraper::DraftCreateParams::Goal::OrSymbol,
            topic: String,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end

      module Goal
        extend XTwitterScraper::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, XTwitterScraper::DraftCreateParams::Goal)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENGAGEMENT =
          T.let(
            :engagement,
            XTwitterScraper::DraftCreateParams::Goal::TaggedSymbol
          )
        FOLLOWERS =
          T.let(
            :followers,
            XTwitterScraper::DraftCreateParams::Goal::TaggedSymbol
          )
        AUTHORITY =
          T.let(
            :authority,
            XTwitterScraper::DraftCreateParams::Goal::TaggedSymbol
          )
        CONVERSATION =
          T.let(
            :conversation,
            XTwitterScraper::DraftCreateParams::Goal::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[XTwitterScraper::DraftCreateParams::Goal::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
