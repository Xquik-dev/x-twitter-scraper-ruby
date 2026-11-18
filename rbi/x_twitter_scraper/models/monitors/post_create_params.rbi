# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module Monitors
      class PostCreateParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::Monitors::PostCreateParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Post link or ID. x.com, twitter.com, mobile & /i/web/status/ links work with any
        # query string.
        sig { returns(String) }
        attr_accessor :post

        # Your own label for the post monitor. Its events carry it as monitorName.
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: T.nilable(String)).void }
        attr_writer :name

        # Post event types to send. Without it, a monitor sends new replies, new quotes,
        # like & retweet changes, edits & deletion.
        sig do
          returns(
            T.nilable(
              T::Array[XTwitterScraper::Models::PostEventType::TaggedSymbol]
            )
          )
        end
        attr_reader :event_types

        sig do
          params(
            event_types:
              T::Array[XTwitterScraper::Models::PostEventType::OrSymbol]
          ).void
        end
        attr_writer :event_types

        # Send false to create the monitor paused. A paused monitor reads nothing & costs
        # nothing until a PATCH sets isActive to true.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :is_active

        sig { params(is_active: T::Boolean).void }
        attr_writer :is_active

        sig do
          params(
            post: String,
            name: T.nilable(String),
            event_types:
              T::Array[XTwitterScraper::Models::PostEventType::OrSymbol],
            is_active: T::Boolean,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Post link or ID. x.com, twitter.com, mobile & /i/web/status/ links work with any
          # query string.
          post:,
          # Your own label for the post monitor. Its events carry it as monitorName.
          name: nil,
          # Post event types to send. Without it, a monitor sends new replies, new quotes,
          # like & retweet changes, edits & deletion.
          event_types: nil,
          # Send false to create the monitor paused. A paused monitor reads nothing & costs
          # nothing until a PATCH sets isActive to true.
          is_active: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              post: String,
              name: String,
              event_types:
                T::Array[XTwitterScraper::Models::PostEventType::TaggedSymbol],
              is_active: T::Boolean,
              request_options: XTwitterScraper::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
