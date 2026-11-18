# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Activity#list
    class ActivityListParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      # @!attribute format_
      #   Answer format. JSON by default.
      #
      #   @return [Symbol, XTwitterScraper::Models::ActivityListParams::Format, nil]
      optional :format_, enum: -> { XTwitterScraper::Models::ActivityListParams::Format }, api_name: :format

      # @!attribute limit
      #   Most rows to return, with no upper limit. A PDF above 10,000 rows comes as a ZIP
      #   of PDF parts.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute category
      #   Activity group, like the Activity page's tabs. `all` by default, or `actions`,
      #   `extractions`, `monitors`, `webhooks` or `billing`.
      #
      #   @return [String, nil]
      optional :category, String

      # @!attribute status
      #   Comma-separated statuses.
      #
      #   @return [String, nil]
      optional :status, String

      # @!attribute q
      #   Search text.
      #
      #   @return [String, nil]
      optional :q, String

      # @!attribute since
      #   Oldest time, ISO 8601.
      #
      #   @return [String, Time, nil]
      optional :since, union: -> { XTwitterScraper::Models::ActivityListParams::Since }

      # @!attribute until_
      #   Newest time, ISO 8601.
      #
      #   @return [String, Time, nil]
      optional :until_, union: -> { XTwitterScraper::Models::ActivityListParams::Until }, api_name: :until

      # @!method initialize(format_: nil, limit: nil, category: nil, status: nil, q: nil, since: nil, until_: nil, request_options: {})
      #   @param format_ [Symbol, XTwitterScraper::Models::ActivityListParams::Format] Answer format. JSON by default.
      #
      #   @param limit [Integer] Most rows to return, with no upper limit. A PDF above 10,000 rows comes as a ZIP of PDF parts.
      #
      #   @param category [String] Activity group, like the Activity page's tabs. `all` by default, or `actions`, `extractions`, `monitors`, `webhooks` or `billing`.
      #
      #   @param status [String] Comma-separated statuses.
      #
      #   @param q [String] Search text.
      #
      #   @param since [String, Time] Oldest time, ISO 8601.
      #
      #   @param until_ [String, Time] Newest time, ISO 8601.
      #
      #   @param request_options [XTwitterScraper::RequestOptions, Hash{Symbol=>Object}]

      module Format
        extend XTwitterScraper::Internal::Type::Enum

        JSON = :json

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      module Since
        extend XTwitterScraper::Internal::Type::Union

        variant String

        variant Time

        # @!method self.variants
        #   @return [Array(String, Time)]
      end

      module Until
        extend XTwitterScraper::Internal::Type::Union

        variant String

        variant Time

        # @!method self.variants
        #   @return [Array(String, Time)]
      end
    end
  end
end
