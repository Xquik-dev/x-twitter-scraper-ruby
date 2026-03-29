# typed: strong

module XTwitterScraper
  module Internal
    module Type
      # @api private
      module RequestParameters
        # Options to specify HTTP behaviour for this request.
        sig { returns(XTwitterScraper::RequestOptions) }
        attr_reader :request_options

        sig do
          params(request_options: XTwitterScraper::RequestOptions::OrHash).void
        end
        attr_writer :request_options

        # @api private
        module Converter
          # @api private
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
