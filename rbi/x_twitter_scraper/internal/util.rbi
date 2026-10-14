# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Internal
    module Util
      extend XTwitterScraper::Internal::Util::SorbetRuntimeSupport

      sig { returns(Float) }
      def self.monotonic_secs
      end

      sig do
        params(ns: T.any(T::Module[T.anything], T::Class[T.anything])).returns(
          T::Enumerable[T.any(T::Module[T.anything], T::Class[T.anything])]
        )
      end
      def self.walk_namespaces(ns)
      end

      class << self
        sig { returns(String) }
        def arch
        end

        sig { returns(String) }
        def os
        end
      end

      class << self
        sig { params(input: T.anything).returns(T::Boolean) }
        def primitive?(input)
        end

        sig do
          params(input: T.any(String, T::Boolean)).returns(
            T.any(T::Boolean, T.anything)
          )
        end
        def coerce_boolean(input)
        end

        sig do
          params(input: T.any(String, T::Boolean)).returns(
            T.nilable(T::Boolean)
          )
        end
        def coerce_boolean!(input)
        end

        sig do
          params(input: T.any(String, Integer)).returns(
            T.any(Integer, T.anything)
          )
        end
        def coerce_integer(input)
        end

        sig do
          params(input: T.any(String, Integer, Float)).returns(
            T.any(Float, T.anything)
          )
        end
        def coerce_float(input)
        end

        sig do
          params(input: T.anything).returns(
            T.any(T::Hash[T.anything, T.anything], T.anything)
          )
        end
        def coerce_hash(input)
        end

        sig do
          params(input: T.anything).returns(
            T.nilable(T::Hash[T.anything, T.anything])
          )
        end
        def coerce_hash!(input)
        end
      end

      class << self
        sig do
          params(lhs: T.anything, rhs: T.anything, concat: T::Boolean).returns(
            T.anything
          )
        end
        private def deep_merge_lr(lhs, rhs, concat: false)
        end

        sig do
          params(
            values: T::Array[T.anything],
            sentinel: T.nilable(T.anything),
            concat: T::Boolean
          ).returns(T.anything)
        end
        def deep_merge(
          *values,
          sentinel: nil,
          concat: false
        )
        end

        sig do
          params(
            data:
              T.any(
                XTwitterScraper::Internal::AnyHash,
                T::Array[T.anything],
                T.anything
              ),
            pick:
              T.nilable(
                T.any(
                  Symbol,
                  Integer,
                  T::Array[T.any(Symbol, Integer)],
                  T.proc.params(arg0: T.anything).returns(T.anything)
                )
              ),
            blk: T.nilable(T.proc.returns(T.anything))
          ).returns(T.nilable(T.anything))
        end
        def dig(data, pick, &blk)
        end
      end

      RFC_3986_NOT_PCHARS = T.let(/[^A-Za-z0-9\-._~!$&'()*+,;=:@]+/, Regexp)

      class << self
        sig { params(uri: URI::Generic).returns(String) }
        def uri_origin(uri)
        end

        sig { params(path: T.any(String, Integer)).returns(String) }
        def encode_path(path)
        end

        sig { params(path: T.any(String, T::Array[String])).returns(String) }
        def interpolate_path(path)
        end
      end

      class << self
        sig do
          params(query: T.nilable(String)).returns(
            T::Hash[String, T::Array[String]]
          )
        end
        def decode_query(query)
        end

        sig do
          params(
            query:
              T.nilable(
                T::Hash[String, T.nilable(T.any(T::Array[String], String))]
              )
          ).returns(T.nilable(String))
        end
        def encode_query(query)
        end
      end

      ParsedUri =
        T.type_alias do
          {
            scheme: T.nilable(String),
            host: T.nilable(String),
            port: T.nilable(Integer),
            path: T.nilable(String),
            query: T::Hash[String, T::Array[String]]
          }
        end

      class << self
        sig do
          params(url: T.any(URI::Generic, String)).returns(
            XTwitterScraper::Internal::Util::ParsedUri
          )
        end
        def parse_uri(url)
        end

        sig do
          params(parsed: XTwitterScraper::Internal::Util::ParsedUri).returns(
            URI::Generic
          )
        end
        def unparse_uri(parsed)
        end

        sig do
          params(
            lhs: XTwitterScraper::Internal::Util::ParsedUri,
            rhs: XTwitterScraper::Internal::Util::ParsedUri
          ).returns(URI::Generic)
        end
        def join_parsed_uri(lhs, rhs)
        end
      end

      class << self
        sig do
          params(
            headers:
              T::Hash[
                String,
                T.nilable(
                  T.any(
                    String,
                    Integer,
                    T::Array[T.nilable(T.any(String, Integer))]
                  )
                )
              ]
          ).returns(T::Hash[String, String])
        end
        def normalized_headers(*headers)
        end
      end

      class ReadIOAdapter
        sig { returns(T.nilable(T::Boolean)) }
        def close?
        end

        sig { void }
        def close
        end

        sig { params(max_len: T.nilable(Integer)).returns(String) }
        private def read_enum(max_len)
        end

        sig do
          params(
            max_len: T.nilable(Integer),
            out_string: T.nilable(String)
          ).returns(T.nilable(String))
        end
        def read(max_len = nil, out_string = nil)
        end

        sig do
          params(
            src: T.any(String, Pathname, StringIO, T::Enumerable[String]),
            blk: T.proc.params(arg0: String).void
          ).returns(T.attached_class)
        end
        def self.new(src, &blk)
        end
      end

      class << self
        sig do
          params(blk: T.proc.params(y: Enumerator::Yielder).void).returns(
            T::Enumerable[String]
          )
        end
        def writable_enum(&blk)
        end
      end

      JSON_CONTENT =
        T.let(%r{^application/(?:[a-zA-Z0-9.-]+\+)?json(?!l)}, Regexp)
      JSONL_CONTENT =
        T.let(%r{^application/(:?x-(?:n|l)djson)|(:?(?:x-)?jsonl)}, Regexp)

      class << self
        sig do
          params(query: XTwitterScraper::Internal::AnyHash).returns(
            XTwitterScraper::Internal::AnyHash
          )
        end
        def encode_query_params(query)
        end

        sig do
          params(
            collection: XTwitterScraper::Internal::AnyHash,
            key: String,
            element: T.anything
          ).void
        end
        private def write_query_param_element!(collection, key, element)
        end

        sig do
          params(
            y: Enumerator::Yielder,
            val: T.anything,
            closing: T::Array[T.proc.void],
            content_type: T.nilable(String)
          ).void
        end
        private def write_multipart_content(
          y,
          val:,
          closing:,
          content_type: nil
        )
        end

        sig do
          params(
            y: Enumerator::Yielder,
            boundary: String,
            key: T.any(Symbol, String),
            val: T.anything,
            closing: T::Array[T.proc.void]
          ).void
        end
        private def write_multipart_chunk(y, boundary:, key:, val:, closing:)
        end

        sig do
          params(body: T.anything).returns([String, T::Enumerable[String]])
        end
        private def encode_multipart_streaming(body)
        end

        sig do
          params(headers: T::Hash[String, String], body: T.anything).returns(
            T.anything
          )
        end
        def encode_content(headers, body)
        end

        sig { params(content_type: String, text: String).void }
        def force_charset!(content_type, text:)
        end

        sig do
          params(
            headers: T::Hash[String, String],
            stream: T::Enumerable[String],
            suppress_error: T::Boolean
          ).returns(T.anything)
        end
        def decode_content(headers, stream:, suppress_error: false)
        end
      end

      class << self
        sig do
          params(
            enum: T::Enumerable[T.anything],
            external: T::Boolean,
            close: T.proc.void
          ).returns(T::Enumerable[T.anything])
        end
        def fused_enum(enum, external: false, &close)
        end

        sig { params(enum: T.nilable(T::Enumerable[T.anything])).void }
        def close_fused!(enum)
        end

        sig do
          params(
            enum: T.nilable(T::Enumerable[T.anything]),
            blk: T.proc.params(arg0: Enumerator::Yielder).void
          ).returns(T::Enumerable[T.anything])
        end
        def chain_fused(enum, &blk)
        end
      end

      ServerSentEvent =
        T.type_alias do
          {
            event: T.nilable(String),
            data: T.nilable(String),
            id: T.nilable(String),
            retry: T.nilable(Integer)
          }
        end

      class << self
        sig do
          params(enum: T::Enumerable[String]).returns(T::Enumerable[String])
        end
        def decode_lines(enum)
        end

        sig do
          params(lines: T::Enumerable[String]).returns(
            T::Enumerable[XTwitterScraper::Internal::Util::ServerSentEvent]
          )
        end
        def decode_sse(lines)
        end
      end

      module SorbetRuntimeSupport
        class MissingSorbetRuntimeError < ::RuntimeError
        end

        sig { returns(T::Hash[Symbol, T.anything]) }
        private def sorbet_runtime_constants
        end

        sig { params(name: Symbol).void }
        def const_missing(name)
        end

        sig { params(name: Symbol).returns(T::Boolean) }
        def sorbet_constant_defined?(name)
        end

        sig { params(name: Symbol, blk: T.proc.returns(T.anything)).void }
        def define_sorbet_constant!(name, &blk)
        end

        sig { returns(T.anything) }
        def to_sorbet_type
        end

        class << self
          sig do
            params(
              type:
                T.any(
                  XTwitterScraper::Internal::Util::SorbetRuntimeSupport,
                  T.anything
                )
            ).returns(T.anything)
          end
          def to_sorbet_type(type)
          end
        end
      end
    end
  end
end
