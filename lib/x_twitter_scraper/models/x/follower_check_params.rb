# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Followers#check
      class FollowerCheckParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        # @!attribute source
        #   Source username, @username, or X or Twitter profile URL
        #
        #   @return [String]
        required :source, String

        # @!attribute target
        #   Target username, @username, or X or Twitter profile URL
        #
        #   @return [String]
        required :target, String

        # @!method initialize(source:, target:, request_options: {})
        #   @param source [String] Source username, @username, or X or Twitter profile URL
        #
        #   @param target [String] Target username, @username, or X or Twitter profile URL
        #
        #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
