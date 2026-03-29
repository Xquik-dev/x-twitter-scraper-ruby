# typed: strong

module XTwitterScraper
  module Models
    module X
      module Users
        class FollowDeleteAllResponse < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::Users::FollowDeleteAllResponse,
                XTwitterScraper::Internal::AnyHash
              )
            end

          sig { returns(T::Boolean) }
          attr_accessor :success

          sig { params(success: T::Boolean).returns(T.attached_class) }
          def self.new(success: true)
          end

          sig { override.returns({ success: T::Boolean }) }
          def to_hash
          end
        end
      end
    end
  end
end
