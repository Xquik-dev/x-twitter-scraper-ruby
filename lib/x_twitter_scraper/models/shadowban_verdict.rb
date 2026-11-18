# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    # Pass means X shows the account there, and fail means it doesn't. Unknown means
    # the check had nothing to test or X didn't answer.
    module ShadowbanVerdict
      extend XTwitterScraper::Internal::Type::Enum

      PASS = :pass
      FAIL = :fail
      UNKNOWN = :unknown

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
