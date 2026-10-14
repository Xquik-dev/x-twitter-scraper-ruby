# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Internal
    module Type
      class FileInput
        extend XTwitterScraper::Internal::Type::Converter

        private_class_method :new

        # @api public
        #
        # @param other [Object]
        #
        # @return [Boolean]
        def self.===(other)
          case other
          in Pathname | StringIO | IO | String | XTwitterScraper::FilePart
            true
          else
            false
          end
        end

        # @api public
        #
        # @param other [Object]
        #
        # @return [Boolean]
        def self.==(other) = other.is_a?(Class) && other <= XTwitterScraper::Internal::Type::FileInput

        class << self
          def coerce(value, state:)
            exactness = state.fetch(:exactness)
            case value
            in String
              exactness[:yes] += 1
              StringIO.new(value)
            in StringIO
              exactness[:yes] += 1
              value
            else
              state[:error] = TypeError.new("#{value.class} can't be coerced into #{StringIO}")
              exactness[:no] += 1
              value
            end
          end

          def dump(value, state:)
            case value
            in StringIO | String
              # https://datatracker.ietf.org/doc/html/rfc7578#section-4.2
              XTwitterScraper::FilePart.new(value, filename: "upload")
            in IO
              state[:can_retry] = false
              value.to_path.nil? ? XTwitterScraper::FilePart.new(value, filename: "upload") : value
            in XTwitterScraper::FilePart if value.content.is_a?(IO)
              state[:can_retry] = false
              value
            else
              value
            end
          end

          def to_sorbet_type
            T.any(Pathname, StringIO, IO, String, XTwitterScraper::FilePart)
          end
        end
      end
    end
  end
end
