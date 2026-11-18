# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Tweets#translate
      class TweetTranslateResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute translation
        #   Holds X's translation of 1 tweet into the requested language. `entities` holds
        #   the links, mentions, and tags with their offsets in the translated text, and is
        #   empty when the text has none.
        #
        #   @return [XTwitterScraper::Models::TweetTranslation]
        required :translation, -> { XTwitterScraper::Models::TweetTranslation }

        # @!method initialize(translation:)
        #   @param translation [XTwitterScraper::Models::TweetTranslation] Holds X's translation of 1 tweet into the requested language. `entities` holds the links, mentions, and tags with their offsets in the translated text, and is empty when the text has none.
      end
    end
  end
end
