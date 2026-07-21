# typed: strong

module XTwitterScraper
  module Models
    module X
      class ProfileUpdateParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::ProfileUpdateParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # X account (@username or ID) to update profile
        sig { returns(String) }
        attr_accessor :account

        sig { returns(String) }
        attr_accessor :idempotency_key

        # Bio description
        sig { returns(T.nilable(String)) }
        attr_reader :description

        sig { params(description: String).void }
        attr_writer :description

        sig { returns(T.nilable(String)) }
        attr_reader :location

        sig { params(location: String).void }
        attr_writer :location

        # Display name
        sig { returns(T.nilable(String)) }
        attr_reader :name

        sig { params(name: String).void }
        attr_writer :name

        # Website URL
        sig { returns(T.nilable(String)) }
        attr_reader :url

        sig { params(url: String).void }
        attr_writer :url

        sig do
          params(
            account: String,
            idempotency_key: String,
            description: String,
            location: String,
            name: String,
            url: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # X account (@username or ID) to update profile
          account:,
          idempotency_key:,
          # Bio description
          description: nil,
          location: nil,
          # Display name
          name: nil,
          # Website URL
          url: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              account: String,
              idempotency_key: String,
              description: String,
              location: String,
              name: String,
              url: String,
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
