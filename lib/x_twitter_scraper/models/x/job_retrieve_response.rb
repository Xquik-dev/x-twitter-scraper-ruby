# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Jobs#retrieve
      class JobRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute job
        #   Public X job listing. A search returns the fields down to the salary, plus
        #   company & account. A lookup adds work type, seniority, function, team &
        #   descriptions. A field X leaves empty is left out.
        #
        #   @return [XTwitterScraper::Models::Job]
        required :job, -> { XTwitterScraper::Models::Job }

        # @!method initialize(job:)
        #   @param job [XTwitterScraper::Models::Job] Public X job listing. A search returns the fields down to the salary, plus company & account. A lookup adds work type, seniority, function, team & descriptions. A field X leaves empty is left out.
      end
    end
  end
end
