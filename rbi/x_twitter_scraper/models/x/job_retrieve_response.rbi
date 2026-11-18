# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class JobRetrieveResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::JobRetrieveResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Public X job listing. A search returns the fields down to the salary, plus
        # company & account. A lookup adds work type, seniority, function, team &
        # descriptions. A field X leaves empty is left out.
        sig { returns(XTwitterScraper::Models::Job) }
        attr_reader :job

        sig { params(job: XTwitterScraper::Models::Job::OrHash).void }
        attr_writer :job

        sig do
          params(job: XTwitterScraper::Models::Job::OrHash).returns(
            T.attached_class
          )
        end
        def self.new(
          # Public X job listing. A search returns the fields down to the salary, plus
          # company & account. A lookup adds work type, seniority, function, team &
          # descriptions. A field X leaves empty is left out.
          job:
        )
        end

        sig { override.returns({ job: XTwitterScraper::Models::Job }) }
        def to_hash
        end
      end
    end
  end
end
