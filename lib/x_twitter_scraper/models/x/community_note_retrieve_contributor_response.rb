# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::CommunityNotes#retrieve_contributor
      class CommunityNoteRetrieveContributorResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute contributor
        #   A Community Notes contributor. X names contributors by an alias, never by their
        #   X account. A field X leaves out is left out. Beside a note, X sends its writer
        #   with only some of the counts.
        #
        #   @return [XTwitterScraper::Models::CommunityNotesContributor]
        required :contributor, -> { XTwitterScraper::Models::CommunityNotesContributor }

        # @!method initialize(contributor:)
        #   @param contributor [XTwitterScraper::Models::CommunityNotesContributor] A Community Notes contributor. X names contributors by an alias, never by their X account. A field X leaves out is left out. Beside a note, X sends its writer with only some of the counts.
      end
    end
  end
end
