# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Internal
    module Type
      module BasePage
        Elem = type_member(:out)

        sig { overridable.returns(T::Boolean) }
        def next_page?
        end

        sig { overridable.returns(T.self_type) }
        def next_page
        end

        sig { overridable.params(blk: T.proc.params(arg0: Elem).void).void }
        def auto_paging_each(&blk)
        end

        sig { returns(T::Enumerable[Elem]) }
        def to_enum
        end

        sig do
          params(
            client: XTwitterScraper::Internal::Transport::BaseClient,
            req:
              XTwitterScraper::Internal::Transport::BaseClient::RequestComponents,
            headers: T::Hash[String, String],
            page_data: T.anything
          ).void
        end
        def initialize(client:, req:, headers:, page_data:)
        end
      end
    end
  end
end
