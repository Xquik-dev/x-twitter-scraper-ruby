# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Monitors#deactivate
    class MonitorDeactivateResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute success
      #
      #   @return [Boolean, true]
      required :success, const: true

      # @!method initialize(success: true)
      #   @param success [Boolean, true]
    end
  end
end
