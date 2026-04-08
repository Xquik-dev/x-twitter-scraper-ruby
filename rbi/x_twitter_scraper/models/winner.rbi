# typed: strong

module XTwitterScraper
  module Models
    class Winner < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(XTwitterScraper::Winner, XTwitterScraper::Internal::AnyHash)
        end

      sig { returns(String) }
      attr_accessor :author_username

      sig { returns(T::Boolean) }
      attr_accessor :is_backup

      sig { returns(Integer) }
      attr_accessor :position

      sig { returns(String) }
      attr_accessor :tweet_id

      # Giveaway draw winner with position and backup flag.
      sig do
        params(
          author_username: String,
          is_backup: T::Boolean,
          position: Integer,
          tweet_id: String
        ).returns(T.attached_class)
      end
      def self.new(author_username:, is_backup:, position:, tweet_id:)
      end

      sig do
        override.returns(
          {
            author_username: String,
            is_backup: T::Boolean,
            position: Integer,
            tweet_id: String
          }
        )
      end
      def to_hash
      end
    end
  end
end
