# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class X
      class Tweets
        class Like
          # @api private
          #
          # @param client [XTwitterScraper::Client]
          def initialize(client:)
            @client = client
          end
        end
      end
    end
  end
end
