# typed: strong

module XTwitterScraper
  module Models
    module X
      class AccountBulkRetryResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::AccountBulkRetryResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Number of accounts cleared
        sig { returns(Integer) }
        attr_accessor :cleared

        sig { params(cleared: Integer).returns(T.attached_class) }
        def self.new(
          # Number of accounts cleared
          cleared:
        )
        end

        sig { override.returns({ cleared: Integer }) }
        def to_hash
        end
      end
    end
  end
end
