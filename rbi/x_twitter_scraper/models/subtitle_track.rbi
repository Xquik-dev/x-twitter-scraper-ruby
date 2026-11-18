# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Models
    class SubtitleTrack < XTwitterScraper::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            XTwitterScraper::Models::SubtitleTrack,
            XTwitterScraper::Internal::AnyHash
          )
        end

      # Media key of the video, as media rows carry it.
      sig { returns(T.nilable(String)) }
      attr_reader :media_key

      sig { params(media_key: String).void }
      attr_writer :media_key

      # Language code of the track, in lower case.
      sig { returns(T.nilable(String)) }
      attr_reader :language

      sig { params(language: String).void }
      attr_writer :language

      # Track name the uploader or X gave it.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # True when X transcribed the audio itself.
      sig { returns(T::Boolean) }
      attr_accessor :auto_generated

      # Link to the track's first WebVTT file.
      sig { returns(String) }
      attr_accessor :url

      # Every cue's text in order, as 1 line.
      sig { returns(String) }
      attr_accessor :text

      # True when X didn't serve every caption file of the track in time, so the cues
      # cover only its start. Retry for the rest.
      sig { returns(T::Boolean) }
      attr_accessor :truncated

      # Timed captions in order.
      sig { returns(T::Array[XTwitterScraper::Models::SubtitleTrack::Cue]) }
      attr_reader :cues

      sig do
        params(
          cues: T::Array[XTwitterScraper::Models::SubtitleTrack::Cue::OrHash]
        ).void
      end
      attr_writer :cues

      sig do
        params(
          auto_generated: T::Boolean,
          url: String,
          text: String,
          truncated: T::Boolean,
          cues: T::Array[XTwitterScraper::Models::SubtitleTrack::Cue::OrHash],
          media_key: String,
          language: String,
          name: String
        ).returns(T.attached_class)
      end
      def self.new(
        # True when X transcribed the audio itself.
        auto_generated:,
        # Link to the track's first WebVTT file.
        url:,
        # Every cue's text in order, as 1 line.
        text:,
        # True when X didn't serve every caption file of the track in time, so the cues
        # cover only its start. Retry for the rest.
        truncated:,
        # Timed captions in order.
        cues:,
        # Media key of the video, as media rows carry it.
        media_key: nil,
        # Language code of the track, in lower case.
        language: nil,
        # Track name the uploader or X gave it.
        name: nil
      )
      end

      sig do
        override.returns(
          {
            media_key: String,
            language: String,
            name: String,
            auto_generated: T::Boolean,
            url: String,
            text: String,
            truncated: T::Boolean,
            cues: T::Array[XTwitterScraper::Models::SubtitleTrack::Cue]
          }
        )
      end
      def to_hash
      end

      class Cue < XTwitterScraper::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              XTwitterScraper::Models::SubtitleTrack::Cue,
              XTwitterScraper::Internal::AnyHash
            )
          end

        # Start time in milliseconds.
        sig { returns(Integer) }
        attr_accessor :start_ms

        # End time in milliseconds.
        sig { returns(Integer) }
        attr_accessor :end_ms

        # Caption text, with a line break between lines.
        sig { returns(String) }
        attr_accessor :text

        sig do
          params(start_ms: Integer, end_ms: Integer, text: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # Start time in milliseconds.
          start_ms:,
          # End time in milliseconds.
          end_ms:,
          # Caption text, with a line break between lines.
          text:
        )
        end

        sig do
          override.returns({ start_ms: Integer, end_ms: Integer, text: String })
        end
        def to_hash
        end
      end
    end
  end
end
