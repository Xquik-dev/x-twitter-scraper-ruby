# typed: strong

module XTwitterScraper
  module Models
    class StyleUpdateParams < XTwitterScraper::Internal::Type::BaseModel
      extend XTwitterScraper::Internal::Type::RequestParameters::Converter
      include XTwitterScraper::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::StyleUpdateParams,
            XTwitterScraper::Internal::AnyHash
          )
        end

      sig { returns(String) }
      attr_accessor :id

      # Display label for the style
      sig { returns(String) }
      attr_accessor :label

      # Array of tweet objects
      sig { returns(T::Array[XTwitterScraper::StyleUpdateParams::Tweet]) }
      attr_accessor :tweets

      sig do
        params(
          id: String,
          label: String,
          tweets: T::Array[XTwitterScraper::StyleUpdateParams::Tweet::OrHash],
          request_options: XTwitterScraper::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        id:,
        # Display label for the style
        label:,
        # Array of tweet objects
        tweets:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            id: String,
            label: String,
            tweets: T::Array[XTwitterScraper::StyleUpdateParams::Tweet],
            request_options: XTwitterScraper::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Tweet < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::StyleUpdateParams::Tweet,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :text

        sig { params(text: String).returns(T.attached_class) }
        def self.new(text:)
        end

        sig { override.returns({ text: String }) }
        def to_hash
        end
      end
    end
  end
end
