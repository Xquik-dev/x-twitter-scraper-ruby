# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# typed: strong

module XTwitterScraper
  module Internal
    module Transport
      class PooledNetRequester
        extend XTwitterScraper::Internal::Util::SorbetRuntimeSupport

        Request =
          T.type_alias do
            {
              method: Symbol,
              url: URI::Generic,
              headers: T::Hash[String, String],
              body: T.anything,
              deadline: Float
            }
          end

        KEEP_ALIVE_TIMEOUT = 30

        DEFAULT_MAX_CONNECTIONS = T.let(T.unsafe(nil), Integer)

        class << self
          sig do
            params(cert_store: OpenSSL::X509::Store, url: URI::Generic).returns(
              Net::HTTP
            )
          end
          def connect(cert_store:, url:)
          end

          sig { params(conn: Net::HTTP, deadline: Float).void }
          def calibrate_socket_timeout(conn, deadline)
          end

          sig do
            params(
              request:
                XTwitterScraper::Internal::Transport::PooledNetRequester::Request,
              blk: T.proc.params(arg0: String).void
            ).returns([Net::HTTPGenericRequest, T.proc.void])
          end
          def build_request(request, &blk)
          end
        end

        sig do
          params(
            url: URI::Generic,
            deadline: Float,
            blk: T.proc.params(arg0: Net::HTTP).void
          ).void
        end
        private def with_pool(url, deadline:, &blk)
        end

        sig do
          params(
            request:
              XTwitterScraper::Internal::Transport::PooledNetRequester::Request
          ).returns([Integer, Net::HTTPResponse, T::Enumerable[String]])
        end
        def execute(request)
        end

        sig { params(size: Integer).returns(T.attached_class) }
        def self.new(
          size: XTwitterScraper::Internal::Transport::PooledNetRequester::DEFAULT_MAX_CONNECTIONS
        )
        end
      end
    end
  end
end
