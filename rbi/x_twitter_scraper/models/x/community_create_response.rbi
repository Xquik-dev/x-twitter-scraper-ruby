# typed: strong

module XTwitterScraper
  module Models
    module X
      class CommunityCreateResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::CommunityCreateResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :community_id

        sig { returns(T::Boolean) }
        attr_accessor :success

        sig { returns(T.nilable(String)) }
        attr_reader :community_name

        sig { params(community_name: String).void }
        attr_writer :community_name

        sig do
          params(
            community_id: String,
            community_name: String,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(community_id:, community_name: nil, success: true)
        end

        sig do
          override.returns(
            {
              community_id: String,
              success: T::Boolean,
              community_name: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
