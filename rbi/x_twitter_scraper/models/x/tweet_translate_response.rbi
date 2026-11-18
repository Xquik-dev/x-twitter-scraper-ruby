# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetTranslateResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::TweetTranslateResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Holds X's translation of 1 tweet into the requested language. `entities` holds
        # the links, mentions, and tags with their offsets in the translated text, and is
        # empty when the text has none.
        sig { returns(XTwitterScraper::Models::TweetTranslation) }
        attr_reader :translation

        sig do
          params(
            translation: XTwitterScraper::Models::TweetTranslation::OrHash
          ).void
        end
        attr_writer :translation

        sig do
          params(
            translation: XTwitterScraper::Models::TweetTranslation::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Holds X's translation of 1 tweet into the requested language. `entities` holds
          # the links, mentions, and tags with their offsets in the translated text, and is
          # empty when the text has none.
          translation:
        )
        end

        sig do
          override.returns(
            { translation: XTwitterScraper::Models::TweetTranslation }
          )
        end
        def to_hash
        end
      end
    end
  end
end
