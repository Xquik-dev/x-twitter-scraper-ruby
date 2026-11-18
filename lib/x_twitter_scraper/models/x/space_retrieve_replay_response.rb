# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Models
    module X
      # @see XTwitterScraper::Resources::X::Spaces#retrieve_replay
      class SpaceRetrieveReplayResponse < XTwitterScraper::Internal::Type::BaseModel
        # @!attribute replay
        #   Recording of an ended Space
        #
        #   @return [XTwitterScraper::Models::X::SpaceRetrieveReplayResponse::Replay]
        required :replay, -> { XTwitterScraper::Models::X::SpaceRetrieveReplayResponse::Replay }

        # @!method initialize(replay:)
        #   @param replay [XTwitterScraper::Models::X::SpaceRetrieveReplayResponse::Replay] Recording of an ended Space

        class Replay < XTwitterScraper::Internal::Type::BaseModel
          # @!attribute url
          #   HLS playlist of the recording
          #
          #   @return [String]
          required :url, String

          # @!attribute stream_type
          #   Stream format, as X names it
          #
          #   @return [String, nil]
          optional :stream_type, String, api_name: :streamType

          # @!attribute status
          #   Stream status, as X names it
          #
          #   @return [String, nil]
          optional :status, String

          # @!method initialize(url:, stream_type: nil, status: nil)
          #   Recording of an ended Space
          #
          #   @param url [String] HLS playlist of the recording
          #
          #   @param stream_type [String] Stream format, as X names it
          #
          #   @param status [String] Stream status, as X names it
        end
      end
    end
  end
end
