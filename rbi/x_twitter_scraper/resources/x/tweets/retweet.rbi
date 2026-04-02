# typed: strong

module XTwitterScraper
  module Resources
    class X
      class Tweets
        class Retweet
          # @api private
          sig do
            params(client: XTwitterScraper::Client).returns(T.attached_class)
          end
          def self.new(client:)
          end
        end
      end
    end
  end
end
