# typed: strong

module XTwitterScraper
  module Models
    module X
      class CommunityDeleteParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::CommunityDeleteParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        # X account (@username or account ID)
        sig { returns(String) }
        attr_accessor :account

        # Community name for confirmation
        sig { returns(String) }
        attr_accessor :community_name

        sig do
          params(
            id: String,
            account: String,
            community_name: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          # X account (@username or account ID)
          account:,
          # Community name for confirmation
          community_name:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              id: String,
              account: String,
              community_name: String,
              request_options: XTwitterScraper::RequestOptions
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
