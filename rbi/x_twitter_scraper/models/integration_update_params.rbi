# typed: strong

module XTwitterScraper
  module Models
    class IntegrationUpdateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::IntegrationUpdateParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(T.nilable(T::Array[XTwitterScraper::EventType::OrSymbol])) }
      attr_reader :event_types

      sig do
        params(event_types: T::Array[XTwitterScraper::EventType::OrSymbol]).void
      end
      attr_writer :event_types

      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :filters

      sig { params(filters: T::Hash[Symbol, T.anything]).void }
      attr_writer :filters

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :is_active

      sig { params(is_active: T::Boolean).void }
      attr_writer :is_active

      sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
      attr_reader :message_template

      sig { params(message_template: T::Hash[Symbol, T.anything]).void }
      attr_writer :message_template

      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :scope_all_monitors

      sig { params(scope_all_monitors: T::Boolean).void }
      attr_writer :scope_all_monitors

      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :silent_push

      sig { params(silent_push: T::Boolean).void }
      attr_writer :silent_push

      sig do
        params(
          id: String,
          event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
          filters: T::Hash[Symbol, T.anything],
          is_active: T::Boolean,
          message_template: T::Hash[Symbol, T.anything],
          name: String,
          scope_all_monitors: T::Boolean,
          silent_push: T::Boolean,
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        event_types: nil,
        filters: nil,
        is_active: nil,
        message_template: nil,
        name: nil,
        scope_all_monitors: nil,
        silent_push: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            event_types: T::Array[XTwitterScraper::EventType::OrSymbol],
            filters: T::Hash[Symbol, T.anything],
            is_active: T::Boolean,
            message_template: T::Hash[Symbol, T.anything],
            name: String,
            scope_all_monitors: T::Boolean,
            silent_push: T::Boolean,
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
