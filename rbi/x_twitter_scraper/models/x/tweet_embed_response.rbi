# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetEmbedResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::TweetEmbedResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Holds the HTML that embeds 1 tweet on a website.
        sig { returns(XTwitterScraper::Models::TweetEmbed) }
        attr_reader :embed

        sig { params(embed: XTwitterScraper::Models::TweetEmbed::OrHash).void }
        attr_writer :embed

        sig do
          params(embed: XTwitterScraper::Models::TweetEmbed::OrHash).returns(
            T.attached_class
          )
        end
        def self.new(
          # Holds the HTML that embeds 1 tweet on a website.
          embed:
        )
        end

        sig { override.returns({ embed: XTwitterScraper::Models::TweetEmbed }) }
        def to_hash
        end
      end
    end
  end
end
