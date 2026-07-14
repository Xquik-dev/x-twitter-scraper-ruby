# typed: strong

module XTwitterScraper
  module Models
    module X
      class TweetCreateResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::TweetCreateResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        sig { returns(T::Boolean) }
        attr_accessor :charged

        # Credits charged for this tweet. Text-only tweets and replies cost 30 credits;
        # attached media adds 2 credits per started MB.
        sig { returns(String) }
        attr_accessor :charged_credits

        sig { returns(T::Boolean) }
        attr_accessor :success

        sig { returns(String) }
        attr_accessor :tweet_id

        sig { returns(T.nilable(String)) }
        attr_reader :write_action_id

        sig { params(write_action_id: String).void }
        attr_writer :write_action_id

        sig do
          params(
            charged: T::Boolean,
            charged_credits: String,
            tweet_id: String,
            write_action_id: String,
            success: T::Boolean
          ).returns(T.attached_class)
        end
        def self.new(
          charged:,
          # Credits charged for this tweet. Text-only tweets and replies cost 30 credits;
          # attached media adds 2 credits per started MB.
          charged_credits:,
          tweet_id:,
          write_action_id: nil,
          success: true
        )
        end

        sig do
          override.returns(
            {
              charged: T::Boolean,
              charged_credits: String,
              success: T::Boolean,
              tweet_id: String,
              write_action_id: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
