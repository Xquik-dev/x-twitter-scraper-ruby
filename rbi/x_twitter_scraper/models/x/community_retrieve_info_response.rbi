# typed: strong

module XTwitterScraper
  module Models
    module X
      class CommunityRetrieveInfoResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::CommunityRetrieveInfoResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Community info object
        sig { returns(T.anything) }
        attr_accessor :community

        sig { params(community: T.anything).returns(T.attached_class) }
        def self.new(
          # Community info object
          community:
        )
        end

        sig { override.returns({ community: T.anything }) }
        def to_hash
        end
      end
    end
  end
end
