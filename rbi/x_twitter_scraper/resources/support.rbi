# typed: strong

module XTwitterScraper
  module Resources
    class Support
      # Support ticket management
      sig { returns(XTwitterScraper::Resources::Support::Tickets) }
      attr_reader :tickets

      # @api private
      sig { params(client: XTwitterScraper::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
