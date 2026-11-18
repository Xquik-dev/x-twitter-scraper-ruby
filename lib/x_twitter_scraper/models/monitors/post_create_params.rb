# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Monitors
      # @see XTwitterScraper::Resources::Monitors::Posts#create
      class PostCreateParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute post
        #   Post link or ID. x.com, twitter.com, mobile & /i/web/status/ links work with any
        #   query string.
        #
        #   @return [String]
        required :post, String

        # @!attribute name
        #   Your own label for the post monitor. Its events carry it as monitorName.
        #
        #   @return [String, nil]
        optional :name, String, nil?: true

        # @!attribute event_types
        #   Post event types to send. Without it, a monitor sends new replies, new quotes,
        #   like & retweet changes, edits & deletion.
        #
        #   @return [Array<Symbol, XTwitterScraper::Models::PostEventType>, nil]
        optional :event_types, -> { XTwitterScraper::Internal::Type::ArrayOf[enum: XTwitterScraper::Models::PostEventType] }, api_name: :eventTypes

        # @!attribute is_active
        #   Send false to create the monitor paused. A paused monitor reads nothing & costs
        #   nothing until a PATCH sets isActive to true.
        #
        #   @return [Boolean, nil]
        optional :is_active, XTwitterScraper::Internal::Type::Boolean, api_name: :isActive

        # @!method initialize(post:, name: nil, event_types: nil, is_active: nil, request_options: {})
        #   @param post [String] Post link or ID. x.com, twitter.com, mobile & /i/web/status/ links work with any query string.
        #
        #   @param name [String, nil] Your own label for the post monitor. Its events carry it as monitorName.
        #
        #   @param event_types [Array<Symbol, XTwitterScraper::Models::PostEventType>] Post event types to send. Without it, a monitor sends new replies, new quotes, like & retweet changes, edits & deletion.
        #
        #   @param is_active [Boolean] Send false to create the monitor paused. A paused monitor reads nothing & costs nothing until a PATCH sets isActive to true.
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
