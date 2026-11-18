# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class UserTranslateBioResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::UserTranslateBioResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Null when the profile has no bio.
        sig { returns(T.nilable(XTwitterScraper::Models::ProfileTranslation)) }
        attr_reader :translation

        sig do
          params(
            translation:
              T.nilable(XTwitterScraper::Models::ProfileTranslation::OrHash)
          ).void
        end
        attr_writer :translation

        # Says why translation is null.
        sig { returns(T.nilable(String)) }
        attr_reader :message

        sig { params(message: String).void }
        attr_writer :message

        sig do
          params(
            translation:
              T.nilable(XTwitterScraper::Models::ProfileTranslation::OrHash),
            message: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Null when the profile has no bio.
          translation:,
          # Says why translation is null.
          message: nil
        )
        end

        sig do
          override.returns(
            {
              translation:
                T.nilable(XTwitterScraper::Models::ProfileTranslation),
              message: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
