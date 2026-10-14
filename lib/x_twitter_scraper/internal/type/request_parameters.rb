# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Internal
    module Type
      module RequestParameters
        def self.included(mod)
          raise ArgumentError.new(mod) unless mod <= XTwitterScraper::Internal::Type::BaseModel

          mod.optional(:request_options, XTwitterScraper::RequestOptions)
        end

        module Converter
          def dump_request(params)
            state = {can_retry: true}
            case (dumped = dump(params, state: state))
            in Hash
              options = XTwitterScraper::Internal::Util.coerce_hash!(dumped[:request_options]).to_h
              request_options = state.fetch(:can_retry) ? options : {**options, max_retries: 0}
              [dumped.except(:request_options), request_options]
            else
              [dumped, nil]
            end
          end
        end
      end
    end
  end
end
