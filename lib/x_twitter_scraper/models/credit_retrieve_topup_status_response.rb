# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # @see XTwitterScraper::Resources::Credits#retrieve_topup_status
    class CreditRetrieveTopupStatusResponse < XTwitterScraper::Internal::Type::BaseModel
      # @!attribute status
      #
      #   @return [Symbol, XTwitterScraper::Models::CreditRetrieveTopupStatusResponse::Status]
      required :status, enum: -> { XTwitterScraper::Models::CreditRetrieveTopupStatusResponse::Status }

      # @!attribute amount_dollars
      #   Dollar amount requested for the top-up.
      #
      #   @return [Integer, nil]
      optional :amount_dollars, Integer, nil?: true

      # @!attribute credits
      #   Bigint string credit amount granted or pending.
      #
      #   @return [String, nil]
      optional :credits, String

      # @!method initialize(status:, amount_dollars: nil, credits: nil)
      #   @param status [Symbol, XTwitterScraper::Models::CreditRetrieveTopupStatusResponse::Status]
      #
      #   @param amount_dollars [Integer, nil] Dollar amount requested for the top-up.
      #
      #   @param credits [String] Bigint string credit amount granted or pending.

      # @see XTwitterScraper::Models::CreditRetrieveTopupStatusResponse#status
      module Status
        extend XTwitterScraper::Internal::Type::Enum

        PAID = :paid
        PROCESSING = :processing
        FAILED = :failed
        EXPIRED = :expired

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
