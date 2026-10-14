# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Internal
    module Type
      module RequestParameters
        sig { returns(XTwitterScraper::RequestOptions) }
        attr_reader :request_options

        sig do
          params(request_options: XTwitterScraper::RequestOptions::OrHash).void
        end
        attr_writer :request_options

        module Converter
          sig do
            params(params: T.anything).returns(
              [T.anything, XTwitterScraper::Internal::AnyHash]
            )
          end
          def dump_request(params)
          end
        end
      end
    end
  end
end
