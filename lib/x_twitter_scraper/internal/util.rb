# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Internal
    module Util
      def self.monotonic_secs = Process.clock_gettime(Process::CLOCK_MONOTONIC)

      def self.walk_namespaces(ns)
        ns.constants(false).lazy.flat_map do
          case (c = ns.const_get(_1, false))
          in Module | Class
            walk_namespaces(c)
          else
            []
          end
        end
          .chain([ns])
      end

      class << self
        def arch
          case (arch = RbConfig::CONFIG["arch"])&.downcase
          in nil
            "unknown"
          in /aarch64|arm64/
            "arm64"
          in /x86_64/
            "x64"
          in /arm/
            "arm"
          else
            "other:#{arch}"
          end
        end

        def os
          case (host = RbConfig::CONFIG["host_os"])&.downcase
          in nil
            "Unknown"
          in /linux/
            "Linux"
          in /darwin/
            "MacOS"
          in /freebsd/
            "FreeBSD"
          in /openbsd/
            "OpenBSD"
          in /mswin|mingw|cygwin|ucrt/
            "Windows"
          else
            "Other:#{host}"
          end
        end
      end

      class << self
        def primitive?(input)
          case input
          in true | false | Numeric | Symbol | String
            true
          else
            false
          end
        end

        def coerce_boolean(input)
          case input.is_a?(String) ? input.downcase : input
          in "true"
            true
          in "false"
            false
          else
            input
          end
        end

        def coerce_boolean!(input)
          case coerce_boolean(input)
          in true | false | nil => coerced
            coerced
          else
            raise ArgumentError.new("Unable to coerce #{input.inspect} into boolean value")
          end
        end

        def coerce_integer(input)
          Integer(input, exception: false) || input
        end

        def coerce_float(input)
          Float(input, exception: false) || input
        end

        def coerce_hash(input)
          case input
          in NilClass | Array | Set | Enumerator | StringIO | IO
            input
          else
            input.respond_to?(:to_h) ? input.to_h : input
          end
        end

        def coerce_hash!(input)
          case coerce_hash(input)
          in Hash | nil => coerced
            coerced
          else
            message = "Expected a #{Hash} or #{XTwitterScraper::Internal::Type::BaseModel}, got #{input.inspect}"
            raise ArgumentError.new(message)
          end
        end
      end

      class << self
        private def deep_merge_lr(lhs, rhs, concat: false)
          case [lhs, rhs, concat]
          in [Hash, Hash, _]
            lhs.merge(rhs) { deep_merge_lr(_2, _3, concat: concat) }
          in [Array, Array, true]
            lhs.concat(rhs)
          else
            rhs
          end
        end

        def deep_merge(*values, sentinel: nil, concat: false)
          case values
          in [value, *values]
            values.reduce(value) do |acc, val|
              deep_merge_lr(acc, val, concat: concat)
            end
          else
            sentinel
          end
        end

        def dig(data, pick, &blk)
          case [data, pick]
          in [_, nil]
            data
          in [Hash, Symbol] | [Array, Integer]
            data.fetch(pick) { blk&.call }
          in [Hash | Array, Array]
            pick.reduce(data) do |acc, key|
              case acc
              in Hash if acc.key?(key)
                acc.fetch(key)
              in Array if key.is_a?(Integer) && key < acc.length
                acc[key]
              else
                return blk&.call
              end
            end
          in [_, Proc]
            pick.call(data)
          else
            blk&.call
          end
        end
      end

      RFC_3986_NOT_PCHARS = /[^A-Za-z0-9\-._~!$&'()*+,;=:@]+/

      class << self
        def uri_origin(uri)
          "#{uri.scheme}://#{uri.host}#{":#{uri.port}" unless uri.port == uri.default_port}"
        end

        def encode_path(path)
          path.to_s.gsub(XTwitterScraper::Internal::Util::RFC_3986_NOT_PCHARS) { ERB::Util.url_encode(_1) }
        end

        def interpolate_path(path)
          case path
          in String
            path
          in []
            ""
          in [String => p, *interpolations]
            encoded = interpolations.map { encode_path(_1) }
            format(p, *encoded)
          end
        end
      end

      class << self
        def decode_query(query)
          CGI.parse(query.to_s)
        end

        def encode_query(query)
          query.to_h.empty? ? nil : URI.encode_www_form(query)
        end
      end

      class << self
        def parse_uri(url)
          parsed = URI::Generic.component.zip(URI.split(url)).to_h
          {**parsed, query: decode_query(parsed.fetch(:query))}
        end

        def unparse_uri(parsed)
          URI::Generic.build(**parsed, query: encode_query(parsed.fetch(:query)))
        end

        def join_parsed_uri(lhs, rhs)
          base_path, base_query = lhs.fetch_values(:path, :query)
          slashed = base_path.end_with?("/") ? base_path : "#{base_path}/"

          merged = {**parse_uri(rhs.fetch(:path)), **rhs.except(:path, :query)}
          parsed_path, parsed_query = merged.fetch_values(:path, :query)
          override = URI::Generic.build(**merged.slice(:scheme, :host, :port), path: parsed_path)

          joined = URI.join(URI::Generic.build(lhs.except(:path, :query)), slashed, override)
          query = deep_merge(
            joined.path == base_path ? base_query : {},
            parsed_query,
            rhs[:query].to_h,
            concat: true
          )

          joined.query = encode_query(query)
          joined
        end
      end

      class << self
        def normalized_headers(*headers)
          {}.merge(*headers.compact).to_h do |key, val|
            value =
              case val
              in Array
                val.filter_map { _1&.to_s&.strip }.join(", ")
              else
                val&.to_s&.strip
              end
            [key.downcase, value]
          end
        end
      end

      class ReadIOAdapter
        def close? = @closing

        def close
          case @stream
          in Enumerator
            XTwitterScraper::Internal::Util.close_fused!(@stream)
          in IO if close?
            @stream.close
          else
          end
        end

        private def read_enum(max_len)
          case max_len
          in nil
            @stream.to_a.join
          in Integer
            @buf << @stream.next while @buf.length < max_len
            @buf.slice!(..max_len)
          end
        rescue StopIteration
          @stream = nil
          @buf.slice!(0..)
        end

        def read(max_len = nil, out_string = nil)
          case @stream
          in nil
            nil
          in IO | StringIO
            @stream.read(max_len, out_string)
          in Enumerator
            read = read_enum(max_len)
            case out_string
            in String
              out_string.replace(read)
            in nil
              read
            end
          end
            .tap(&@blk)
        end

        def initialize(src, &blk)
          @stream =
            case src
            in String
              StringIO.new(src)
            in Pathname
              @closing = true
              src.open(binmode: true)
            else
              src
            end
          @buf = String.new
          @blk = blk
        end
      end

      class << self
        def writable_enum(&blk)
          Enumerator.new do |y|
            y.define_singleton_method(:write) do
              self << _1.dup
              _1.bytesize
            end

            blk.call(y)
          end
        end
      end

      JSON_CONTENT = %r{^application/(?:[a-zA-Z0-9.-]+\+)?json(?!l)}
      JSONL_CONTENT = %r{\Aapplication/(?:x-(?:n|l)djson|(?:x-)?jsonl)}

      class << self
        def encode_query_params(query)
          out = {}
          query.each { write_query_param_element!(out, _1, _2) }
          out
        end

        private def write_query_param_element!(collection, key, element)
          case element
          in Hash
            element.each do |name, value|
              write_query_param_element!(collection, "#{key}[#{name}]", value)
            end
          in Array
            collection[key] = element.join(",")
          else
            collection[key] = element.to_s
          end
        end

        private def write_multipart_content(y, val:, closing:, content_type: nil)
          content_line = "Content-Type: %s\r\n\r\n"

          case val
          in XTwitterScraper::FilePart
            return write_multipart_content(
              y,
              val: val.content,
              closing: closing,
              content_type: val.content_type
            )
          in Pathname
            y << format(content_line, content_type || "application/octet-stream")
            io = val.open(binmode: true)
            closing << io.method(:close)
            IO.copy_stream(io, y)
          in IO
            y << format(content_line, content_type || "application/octet-stream")
            IO.copy_stream(val, y)
          in StringIO
            y << format(content_line, content_type || "application/octet-stream")
            y << val.string
          in -> { primitive?(_1) }
            y << format(content_line, content_type || "text/plain")
            y << val.to_s
          else
            y << format(content_line, content_type || "application/json")
            y << JSON.generate(val)
          end
          y << "\r\n"
        end

        private def write_multipart_chunk(y, boundary:, key:, val:, closing:)
          y << "--#{boundary}\r\n"
          y << "Content-Disposition: form-data"

          unless key.nil?
            y << "; name=\"#{key}\""
          end

          case val
          in XTwitterScraper::FilePart unless val.filename.nil?
            filename = encode_path(val.filename)
            y << "; filename=\"#{filename}\""
          in Pathname | IO
            filename = encode_path(::File.basename(val.to_path))
            y << "; filename=\"#{filename}\""
          else
          end
          y << "\r\n"

          write_multipart_content(y, val: val, closing: closing)
        end

        # https://github.com/OAI/OpenAPI-Specification/blob/main/versions/3.1.1.md#special-considerations-for-multipart-content
        private def encode_multipart_streaming(body)
          # rubocop:disable Style/CaseEquality
          boundary = SecureRandom.urlsafe_base64(46)

          closing = []
          strio = writable_enum do |y|
            case body
            in Hash
              body.each do |key, val|
                case val
                in Array if val.all? { primitive?(_1) || XTwitterScraper::Internal::Type::FileInput === _1 }
                  val.each do |v|
                    write_multipart_chunk(y, boundary: boundary, key: key, val: v, closing: closing)
                  end
                else
                  write_multipart_chunk(y, boundary: boundary, key: key, val: val, closing: closing)
                end
              end
            else
              write_multipart_chunk(y, boundary: boundary, key: nil, val: body, closing: closing)
            end
            y << "--#{boundary}--\r\n"
          end

          fused_io = fused_enum(strio) { closing.each(&:call) }
          [boundary, fused_io]
          # rubocop:enable Style/CaseEquality
        end

        def encode_content(headers, body)
          # rubocop:disable Style/CaseEquality
          # rubocop:disable Layout/LineLength
          content_type = headers["content-type"]
          case [content_type, body]
          in [XTwitterScraper::Internal::Util::JSON_CONTENT, Hash | Array | -> { primitive?(_1) }]
            [headers, JSON.generate(body)]
          in [XTwitterScraper::Internal::Util::JSONL_CONTENT, Enumerable] unless XTwitterScraper::Internal::Type::FileInput === body
            [headers, body.lazy.map { JSON.generate(_1) }]
          in [%r{^multipart/form-data}, Hash | XTwitterScraper::Internal::Type::FileInput]
            boundary, strio = encode_multipart_streaming(body)
            headers = {**headers, "content-type" => "#{content_type}; boundary=#{boundary}"}
            [headers, strio]
          in [_, Symbol | Numeric]
            [headers, body.to_s]
          in [_, StringIO]
            [headers, body.string]
          in [_, XTwitterScraper::FilePart]
            [headers, body.content]
          else
            [headers, body]
          end
          # rubocop:enable Layout/LineLength
          # rubocop:enable Style/CaseEquality
        end

        def force_charset!(content_type, text:)
          charset = /charset=([^;\s]+)/.match(content_type)&.captures&.first

          return unless charset

          begin
            encoding = Encoding.find(charset)
            text.force_encoding(encoding)
          rescue ArgumentError
            nil
          end
        end

        def decode_content(headers, stream:, suppress_error: false)
          case (content_type = headers["content-type"])
          in XTwitterScraper::Internal::Util::JSON_CONTENT
            return nil if (json = stream.to_a.join).empty?

            begin
              JSON.parse(json, symbolize_names: true)
            rescue JSON::ParserError => e
              raise e unless suppress_error
              json
            end
          in XTwitterScraper::Internal::Util::JSONL_CONTENT
            lines = decode_lines(stream)
            chain_fused(lines) do |y|
              lines.each do
                next if _1.empty?

                y << JSON.parse(_1, symbolize_names: true)
              end
            end
          in %r{^text/event-stream}
            lines = decode_lines(stream)
            decode_sse(lines)
          else
            text = stream.to_a.join
            force_charset!(content_type, text: text)
            StringIO.new(text)
          end
        end
      end

      class << self
        def fused_enum(enum, external: false, &close)
          fused = false
          iter = Enumerator.new do |y|
            next if fused

            fused = true
            if external
              loop { y << enum.next }
            else
              enum.each(&y)
            end
          ensure
            close&.call
            close = nil
          end

          iter.define_singleton_method(:rewind) do
            fused = true
            self
          end
          iter
        end

        def close_fused!(enum)
          return unless enum.is_a?(Enumerator)

          # rubocop:disable-next Lint/UnreachableLoop
          enum.rewind.each { break }
        end

        def chain_fused(enum, &blk)
          iter = Enumerator.new { blk.call(_1) }
          fused_enum(iter) { close_fused!(enum) }
        end
      end

      class << self
        def decode_lines(enum)
          re = /(\r\n|\r|\n)/
          buffer = String.new
          cr_seen = nil

          chain_fused(enum) do |y|
            enum.each do |row|
              offset = buffer.bytesize
              buffer << row
              while (match = re.match(buffer, cr_seen&.to_i || offset))
                case [match.captures.first, cr_seen]
                in ["\r", nil]
                  cr_seen = match.end(1)
                  next
                in ["\r" | "\r\n", Integer]
                  y << buffer.slice!(..(cr_seen.pred))
                else
                  y << buffer.slice!(..(match.end(1).pred))
                end
                offset = 0
                cr_seen = nil
              end
            end

            y << buffer.slice!(..(cr_seen.pred)) unless cr_seen.nil?
            y << buffer unless buffer.empty?
          end
        end

        def decode_sse(lines)
          # rubocop:disable Metrics/BlockLength
          chain_fused(lines) do |y|
            blank = {event: nil, data: nil, id: nil, retry: nil}
            current = {}

            lines.each do |line|
              case line.sub(/\R$/, "")
              in ""
                next if current.empty?
                y << {**blank, **current}
                current = {}
              in /^:/
                next
              in /^([^:]+):\s?(.*)$/
                field, value = Regexp.last_match.captures
                case field
                in "event"
                  current.merge!(event: value)
                in "data"
                  (current[:data] ||= String.new) << (value << "\n")
                in "id" unless value.include?("\0")
                  current.merge!(id: value)
                in "retry" if /^\d+$/ =~ value
                  current.merge!(retry: Integer(value))
                else
                end
              else
              end
            end
            # rubocop:enable Metrics/BlockLength

            y << {**blank, **current} unless current.empty?
          end
        end
      end

      module SorbetRuntimeSupport
        class MissingSorbetRuntimeError < ::RuntimeError
        end

        private def sorbet_runtime_constants = @sorbet_runtime_constants ||= {}

        def const_missing(name)
          super unless sorbet_runtime_constants.key?(name)

          unless Object.const_defined?(:T)
            message = "Trying to access a Sorbet constant #{name.inspect} without `sorbet-runtime`."
            raise MissingSorbetRuntimeError.new(message)
          end

          sorbet_runtime_constants.fetch(name).call
        end

        def sorbet_constant_defined?(name) = sorbet_runtime_constants.key?(name)

        def define_sorbet_constant!(name, &blk) = sorbet_runtime_constants.store(name, blk)

        def to_sorbet_type = raise(NotImplementedError)

        class << self
          def to_sorbet_type(type)
            case type
            in XTwitterScraper::Internal::Util::SorbetRuntimeSupport
              type.to_sorbet_type
            in Class | Module
              type
            in true | false
              T::Boolean
            else
              type.class
            end
          end
        end
      end

      extend XTwitterScraper::Internal::Util::SorbetRuntimeSupport

      define_sorbet_constant!(:ParsedUri) do
        T.type_alias do
          {
            scheme: T.nilable(String),
            host: T.nilable(String),
            port: T.nilable(Integer),
            path: T.nilable(String),
            query: T::Hash[String, T::Array[String]]
          }
        end
      end

      define_sorbet_constant!(:ServerSentEvent) do
        T.type_alias do
          {
            event: T.nilable(String),
            data: T.nilable(String),
            id: T.nilable(String),
            retry: T.nilable(Integer)
          }
        end
      end
    end
  end
end
