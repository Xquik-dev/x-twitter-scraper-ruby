# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module Support
      # @see XTwitterScraper::Resources::Support::Tickets#update
      class TicketUpdateResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute public_id
        #
        #   @return [String, nil]
        optional :public_id, String, api_name: :publicId

        # @!attribute status
        #
        #   @return [String, nil]
        optional :status, String

        # @!method initialize(public_id: nil, status: nil)
        #   @param public_id [String]
        #   @param status [String]
      end
    end
  end
end
