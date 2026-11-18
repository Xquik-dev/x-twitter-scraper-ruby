# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    module X
      class SpaceRetrieveReplayResponse < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::X::SpaceRetrieveReplayResponse,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Recording of an ended Space
        sig do
          returns(
            XTwitterScraper::Models::X::SpaceRetrieveReplayResponse::Replay
          )
        end
        attr_reader :replay

        sig do
          params(
            replay:
              XTwitterScraper::Models::X::SpaceRetrieveReplayResponse::Replay::OrHash
          ).void
        end
        attr_writer :replay

        sig do
          params(
            replay:
              XTwitterScraper::Models::X::SpaceRetrieveReplayResponse::Replay::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Recording of an ended Space
          replay:
        )
        end

        sig do
          override.returns(
            {
              replay:
                XTwitterScraper::Models::X::SpaceRetrieveReplayResponse::Replay
            }
          )
        end
        def to_hash
        end

        class Replay < XTwitterScraper::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                XTwitterScraper::Models::X::SpaceRetrieveReplayResponse::Replay,
                XTwitterScraper::Internal::AnyHash
              )
            end

          # HLS playlist of the recording
          sig { returns(String) }
          attr_accessor :url

          # Stream format, as X names it
          sig { returns(T.nilable(String)) }
          attr_reader :stream_type

          sig { params(stream_type: String).void }
          attr_writer :stream_type

          # Stream status, as X names it
          sig { returns(T.nilable(String)) }
          attr_reader :status

          sig { params(status: String).void }
          attr_writer :status

          sig do
            params(url: String, stream_type: String, status: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # HLS playlist of the recording
            url:,
            # Stream format, as X names it
            stream_type: nil,
            # Stream status, as X names it
            status: nil
          )
          end

          sig do
            override.returns(
              { url: String, stream_type: String, status: String }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
