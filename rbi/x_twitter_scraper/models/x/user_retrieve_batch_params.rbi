# typed: strong

module XTwitterScraper
  module Models
    module X
      class UserRetrieveBatchParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::UserRetrieveBatchParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Comma-separated numeric user IDs (1-100 values). Duplicate IDs are ignored while
        # preserving first-seen order.
        sig { returns(String) }
        attr_accessor :ids

        sig do
          params(
            ids: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Comma-separated numeric user IDs (1-100 values). Duplicate IDs are ignored while
          # preserving first-seen order.
          ids:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            { ids: String, request_options: XTwitterScraper::RequestOptions }
          )
        end
        def to_hash
        end
      end
    end
  end
end
