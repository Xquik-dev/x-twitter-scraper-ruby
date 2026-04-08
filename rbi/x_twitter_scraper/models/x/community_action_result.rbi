# typed: strong

module XTwitterScraper
  module Models
    module X
      class CommunityActionResult < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::CommunityActionResult,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :community_id

        sig { returns(String) }
        attr_accessor :community_name

        sig { returns(T::Boolean) }
        attr_accessor :success

        # Result of a community join or leave action.
        sig do
          params(
            community_id: String,
            community_name: String,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(community_id:, community_name:, success: true)
        end

        sig do
          override.returns(
            {
              community_id: String,
              community_name: String,
              success: T::Boolean
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
