# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class StyleUpdateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::StyleUpdateParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      # Display label for the style
      sig { returns(T.nilable(String)) }
      attr_reader :label

      sig { params(label: String).void }
      attr_writer :label

      # Array of tweet objects
      sig { returns(T::Array[XTwitterScraper::StyleUpdateParams::Tweet]) }
      attr_accessor :tweets

      sig do
        params(
          id: String,
          tweets: T::Array[XTwitterScraper::StyleUpdateParams::Tweet::OrHash],
          label: String,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Array of tweet objects
        tweets:,
        # Display label for the style
        label: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            label: String,
            tweets: T::Array[XTwitterScraper::StyleUpdateParams::Tweet],
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Tweet < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::StyleUpdateParams::Tweet,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :text

        sig { params(text: String).returns(T.attached_class) }
        def self.new(text:)
        end

        sig { override.returns({ text: String }) }
        def to_hash
        end
      end
    end
  end
end
