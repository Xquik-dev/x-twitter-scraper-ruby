# typed: strong

module XTwitterScraper
  module Models
    module X
      module Tweets
        class LikeDeleteResponse < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::Tweets::LikeDeleteResponse,
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
