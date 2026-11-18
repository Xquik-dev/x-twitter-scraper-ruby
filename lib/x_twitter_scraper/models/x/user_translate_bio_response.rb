# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Users#translate_bio
      class UserTranslateBioResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute translation
        #   Null when the profile has no bio.
        #
        #   @return [XTwitterScraper::Models::ProfileTranslation, nil]
        required :translation, -> { XTwitterScraper::Models::ProfileTranslation }, nil?: true

        # @!attribute message
        #   Says why translation is null.
        #
        #   @return [String, nil]
        optional :message, String

        # @!method initialize(translation:, message: nil)
        #   @param translation [XTwitterScraper::Models::ProfileTranslation, nil] Null when the profile has no bio.
        #
        #   @param message [String] Says why translation is null.
      end
    end
  end
end
