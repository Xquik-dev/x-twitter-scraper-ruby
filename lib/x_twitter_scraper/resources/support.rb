# frozen_string_literal: true

module XTwitterScraper
  module Resources
    class Support
      # Support ticket management
      # @return [XTwitterScraper::Resources::Support::Attachments]
      attr_reader :attachments

      # Support ticket management
      # @return [XTwitterScraper::Resources::Support::Tickets]
      attr_reader :tickets

      # @api private
      #
      # @param client [XTwitterScraper::Client]
      def initialize(client:)
        @client = client
        @attachments = XTwitterScraper::Resources::Support::Attachments.new(client: client)
        @tickets = XTwitterScraper::Resources::Support::Tickets.new(client: client)
      end
    end
  end
end
