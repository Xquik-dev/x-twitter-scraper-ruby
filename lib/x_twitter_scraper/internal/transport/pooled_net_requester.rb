# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

module XTwitterScraper
  module Internal
    module Transport
      class PooledNetRequester
        extend XTwitterScraper::Internal::Util::SorbetRuntimeSupport

        KEEP_ALIVE_TIMEOUT = 30

        DEFAULT_MAX_CONNECTIONS = [Etc.nprocessors, 99].max

        class << self
          def connect(cert_store:, url:)
            port =
              case [url.port, url.scheme]
              in [Integer, _]
                url.port
              in [nil, "http" | "ws"]
                Net::HTTP.http_default_port
              in [nil, "https" | "wss"]
                Net::HTTP.https_default_port
              end

            Net::HTTP.new(url.host, port).tap do
              _1.use_ssl = %w[https wss].include?(url.scheme)
              _1.max_retries = 0

              (_1.cert_store = cert_store) if _1.use_ssl?
            end
          end

          def calibrate_socket_timeout(conn, deadline)
            timeout = deadline - XTwitterScraper::Internal::Util.monotonic_secs
            conn.open_timeout = conn.read_timeout = conn.write_timeout = conn.continue_timeout = timeout
          end

          def build_request(request, &blk)
            method, url, headers, body = request.fetch_values(:method, :url, :headers, :body)
            req = Net::HTTPGenericRequest.new(
              method.to_s.upcase,
              !body.nil?,
              method != :head,
              URI(url.to_s)
            )

            headers.each { req[_1] = _2 }

            case body
            in nil
              req["content-length"] ||= 0 unless req["transfer-encoding"]
            in String
              req["content-length"] ||= body.bytesize.to_s unless req["transfer-encoding"]
              req.body_stream = XTwitterScraper::Internal::Util::ReadIOAdapter.new(body, &blk)
            in StringIO
              req["content-length"] ||= body.size.to_s unless req["transfer-encoding"]
              req.body_stream = XTwitterScraper::Internal::Util::ReadIOAdapter.new(body, &blk)
            in Pathname | IO | Enumerator
              req["transfer-encoding"] ||= "chunked" unless req["content-length"]
              req.body_stream = XTwitterScraper::Internal::Util::ReadIOAdapter.new(body, &blk)
            end

            [req, req.body_stream&.method(:close)]
          end
        end

        private def with_pool(url, deadline:, &blk)
          origin = XTwitterScraper::Internal::Util.uri_origin(url)
          timeout = deadline - XTwitterScraper::Internal::Util.monotonic_secs
          pool =
            @mutex.synchronize do
              @pools[origin] ||= ConnectionPool.new(size: @size) do
                self.class.connect(cert_store: @cert_store, url: url)
              end
            end

          pool.with(timeout: timeout, &blk)
        end

        def execute(request)
          url, deadline = request.fetch_values(:url, :deadline)

          req = nil
          finished = false

          # rubocop:disable-next Metrics/BlockLength
          enum = Enumerator.new do |y|
            next if finished

            with_pool(url, deadline: deadline) do |conn|
              eof = false
              closing = nil
              ::Thread.handle_interrupt(Object => :never) do
                ::Thread.handle_interrupt(Object => :immediate) do
                  req, closing = self.class.build_request(request) do
                    self.class.calibrate_socket_timeout(conn, deadline)
                  end

                  self.class.calibrate_socket_timeout(conn, deadline)
                  unless conn.started?
                    conn.keep_alive_timeout = self.class::KEEP_ALIVE_TIMEOUT
                    conn.start
                  end

                  self.class.calibrate_socket_timeout(conn, deadline)
                  ::Kernel.catch(:jump) do
                    conn.request(req) do |rsp|
                      y << [req, rsp]
                      ::Kernel.throw(:jump) if finished

                      rsp.read_body do |bytes|
                        y << bytes.force_encoding(Encoding::BINARY)
                        ::Kernel.throw(:jump) if finished

                        self.class.calibrate_socket_timeout(conn, deadline)
                      end
                      eof = true
                    end
                  end
                end
              ensure
                begin
                  conn.finish if !eof && conn&.started?
                ensure
                  closing&.call
                end
              end
            end
          rescue Timeout::Error
            raise XTwitterScraper::Errors::APITimeoutError.new(url: url, request: req)
          rescue StandardError
            raise XTwitterScraper::Errors::APIConnectionError.new(url: url, request: req)
          end

          _, response = enum.next
          body = XTwitterScraper::Internal::Util.fused_enum(enum, external: true) do
            finished = true
            loop { enum.next }
          end
          [Integer(response.code), response, body]
        end

        def initialize(size: self.class::DEFAULT_MAX_CONNECTIONS)
          @mutex = Mutex.new
          @size = size
          @cert_store = OpenSSL::X509::Store.new.tap(&:set_default_paths)
          @pools = {}
        end

        define_sorbet_constant!(:Request) do
          T.type_alias { {method: Symbol, url: URI::Generic, headers: T::Hash[String, String], body: T.anything, deadline: Float} }
        end
      end
    end
  end
end
