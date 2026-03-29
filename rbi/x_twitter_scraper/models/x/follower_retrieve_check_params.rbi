# typed: strong

module XTwitterScraper
  module Models
    module X
      class FollowerRetrieveCheckParams < XTwitterScraper::Internal::Type::BaseModel
        extend XTwitterScraper::Internal::Type::RequestParameters::Converter
        include XTwitterScraper::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::FollowerRetrieveCheckParams,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Username to check (without @)
        sig { returns(String) }
        attr_accessor :source

        # Target username (without @)
        sig { returns(String) }
        attr_accessor :target

        sig do
          params(
            source: String,
            target: String,
            request_options: XTwitterScraper::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Username to check (without @)
          source:,
          # Target username (without @)
          target:,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              source: String,
              target: String,
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
