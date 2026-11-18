# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class CommunityNoteRetrieveContributorResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::CommunityNoteRetrieveContributorResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # A Community Notes contributor. X names contributors by an alias, never by their
        # X account. A field X leaves out is left out. Beside a note, X sends its writer
        # with only some of the counts.
        sig { returns(XTwitterScraper::Models::CommunityNotesContributor) }
        attr_reader :contributor

        sig do
          params(
            contributor:
              XTwitterScraper::Models::CommunityNotesContributor::OrHash
          ).void
        end
        attr_writer :contributor

        sig do
          params(
            contributor:
              XTwitterScraper::Models::CommunityNotesContributor::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # A Community Notes contributor. X names contributors by an alias, never by their
          # X account. A field X leaves out is left out. Beside a note, X sends its writer
          # with only some of the counts.
          contributor:
        )
        end

        sig do
          override.returns(
            { contributor: XTwitterScraper::Models::CommunityNotesContributor }
          )
        end
        def to_hash
        end
      end
    end
  end
end
