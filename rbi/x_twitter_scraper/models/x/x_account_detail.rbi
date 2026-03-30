# typed: strong

module XTwitterScraper
  module Models
    XAccountDetail = X::XAccountDetail

    module X
      class XAccountDetail < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::X::XAccountDetail,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig { returns(Time) }
        attr_accessor :created_at

        sig { returns(String) }
        attr_accessor :status

        sig { returns(String) }
        attr_accessor :x_user_id

        sig { returns(String) }
        attr_accessor :x_username

        sig { returns(T.nilable(Time)) }
        attr_reader :cookies_obtained_at

        sig { params(cookies_obtained_at: Time).void }
        attr_writer :cookies_obtained_at

        sig { returns(T.nilable(String)) }
        attr_reader :proxy_country

        sig { params(proxy_country: String).void }
        attr_writer :proxy_country

        sig { returns(T.nilable(Time)) }
        attr_reader :updated_at

        sig { params(updated_at: Time).void }
        attr_writer :updated_at

        sig do
          params(
            id: String,
            created_at: Time,
            status: String,
            x_user_id: String,
            x_username: String,
            cookies_obtained_at: Time,
            proxy_country: String,
            updated_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          id:,
          created_at:,
          status:,
          x_user_id:,
          x_username:,
          cookies_obtained_at: nil,
          proxy_country: nil,
          updated_at: nil
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              status: String,
              x_user_id: String,
              x_username: String,
              cookies_obtained_at: Time,
              proxy_country: String,
              updated_at: Time
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
