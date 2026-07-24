# SPDX-FileCopyrightText: 2026 Xquik contributors
#
# SPDX-License-Identifier: Apache-2.0

# frozen_string_literal: true

require_relative "../test_helper"

class XTwitterScraper::Test::InternalEdgeCasesTest < Minitest::Test
  IGNORE_CHUNK = ->(_chunk) { true }

  STATUS_ERRORS = {
    400 => XTwitterScraper::Errors::BadRequestError,
    401 => XTwitterScraper::Errors::AuthenticationError,
    403 => XTwitterScraper::Errors::PermissionDeniedError,
    404 => XTwitterScraper::Errors::NotFoundError,
    409 => XTwitterScraper::Errors::ConflictError,
    422 => XTwitterScraper::Errors::UnprocessableEntityError,
    429 => XTwitterScraper::Errors::RateLimitError,
    500 => XTwitterScraper::Errors::InternalServerError,
    418 => XTwitterScraper::Errors::APIStatusError
  }.freeze

  def with_rbconfig(key, value)
    original = RbConfig::CONFIG[key]
    RbConfig::CONFIG[key] = value
    yield
  ensure
    RbConfig::CONFIG[key] = original
  end

  def test_platform_identification
    architecture_cases = {
      nil => "unknown",
      "aarch64-linux" => "arm64",
      "x86_64-linux" => "x64",
      "armv7-linux" => "arm",
      "mips-linux" => "other:mips-linux"
    }
    architecture_cases.each do |value, expected|
      with_rbconfig("arch", value) do
        assert_equal(expected, XTwitterScraper::Internal::Util.arch)
      end
    end

    operating_system_cases = {
      nil => "Unknown",
      "linux" => "Linux",
      "darwin" => "MacOS",
      "freebsd" => "FreeBSD",
      "openbsd" => "OpenBSD",
      "mingw" => "Windows",
      "solaris" => "Other:solaris"
    }
    operating_system_cases.each do |value, expected|
      with_rbconfig("host_os", value) do
        assert_equal(expected, XTwitterScraper::Internal::Util.os)
      end
    end
  end

  def test_namespace_and_primitive_detection
    namespace = Module.new
    inner = Module.new
    namespace.const_set(:Inner, inner)
    namespace.const_set(:VALUE, 1)

    assert_equal([inner, namespace], XTwitterScraper::Internal::Util.walk_namespaces(namespace).to_a)

    [true, false, 1, 1.0, :symbol, "text"].each do |value|
      assert(XTwitterScraper::Internal::Util.primitive?(value))
    end
    refute(XTwitterScraper::Internal::Util.primitive?(nil))
    refute(XTwitterScraper::Internal::Util.primitive?(Object.new))
  end

  def test_scalar_and_hash_coercion
    assert_equal(true, XTwitterScraper::Internal::Util.coerce_boolean("TRUE"))
    assert_equal(false, XTwitterScraper::Internal::Util.coerce_boolean("false"))
    assert_equal(:unknown, XTwitterScraper::Internal::Util.coerce_boolean(:unknown))
    assert_nil(XTwitterScraper::Internal::Util.coerce_boolean!(nil))
    assert_raises(ArgumentError) { XTwitterScraper::Internal::Util.coerce_boolean!("unknown") }

    assert_equal(42, XTwitterScraper::Internal::Util.coerce_integer("42"))
    assert_equal(:unknown, XTwitterScraper::Internal::Util.coerce_integer(:unknown))
    assert_equal(4.2, XTwitterScraper::Internal::Util.coerce_float("4.2"))
    assert_equal(:unknown, XTwitterScraper::Internal::Util.coerce_float(:unknown))

    convertible = Struct.new(:value) do
      def to_h = {value: value}
    end
    assert_equal({value: 1}, XTwitterScraper::Internal::Util.coerce_hash(convertible.new(1)))
    assert_nil(XTwitterScraper::Internal::Util.coerce_hash!(nil))
    assert_equal({}, XTwitterScraper::Internal::Util.coerce_hash!({}))
    assert_raises(ArgumentError) { XTwitterScraper::Internal::Util.coerce_hash!(Object.new) }
  end

  def test_merge_dig_and_path_edges
    assert_equal(:empty, XTwitterScraper::Internal::Util.deep_merge(sentinel: :empty))
    assert_equal(URI("https://example.com"), URI(XTwitterScraper::Internal::Util.uri_origin(URI("https://example.com"))))
    assert_equal(
      "https://example.com:8443",
      XTwitterScraper::Internal::Util.uri_origin(URI("https://example.com:8443"))
    )

    assert_equal("plain", XTwitterScraper::Internal::Util.interpolate_path("plain"))
    assert_equal("", XTwitterScraper::Internal::Util.interpolate_path([]))
    assert_equal("a%20b/2", XTwitterScraper::Internal::Util.interpolate_path(["%s/%s", "a b", 2]))
    assert_raises(NoMatchingPatternError) { XTwitterScraper::Internal::Util.interpolate_path(Object.new) }

    assert_equal(2, XTwitterScraper::Internal::Util.dig({a: 1}, :missing) { 2 })
    assert_equal(2, XTwitterScraper::Internal::Util.dig({a: []}, [:a, 0]) { 2 })
    assert_nil(XTwitterScraper::Internal::Util.dig({a: []}, [:a, 0]))

    joined = XTwitterScraper::Internal::Util.join_parsed_uri(
      XTwitterScraper::Internal::Util.parse_uri("https://example.com/base/"),
      {path: "child"}
    )
    assert_equal("https://example.com/base/child", joined.to_s)
  end

  def test_headers_and_query_encoding
    headers = XTwitterScraper::Internal::Util.normalized_headers(
      nil,
      {"Accept" => [" text/plain ", nil, 2], "Empty" => nil}
    )
    assert_equal({"accept" => "text/plain, 2", "empty" => nil}, headers)

    assert_equal(
      {"filter[name]" => "x", "filter[ids]" => "1,2", "page" => "3"},
      XTwitterScraper::Internal::Util.encode_query_params(
        {"filter" => {"name" => "x", "ids" => [1, 2]}, "page" => 3}
      )
    )
  end

  def test_read_io_adapter_edges
    seen = []
    adapter = XTwitterScraper::Internal::Util::ReadIOAdapter.new(%w[ab cd].each) { seen << _1 }
    first = adapter.read(2)
    second = adapter.read(2)
    third = adapter.read(2)
    fourth = adapter.read(2)

    assert_equal("ab", first)
    assert_equal("cd", second)
    assert_equal("", third)
    assert_nil(fourth)
    assert_equal(["ab", "cd", "", nil], seen)

    output = String.new
    string_adapter = XTwitterScraper::Internal::Util::ReadIOAdapter.new("abc", &IGNORE_CHUNK)
    assert_same(output, string_adapter.read(2, output))
    assert_equal("ab", output)
    string_adapter.close

    path_adapter = XTwitterScraper::Internal::Util::ReadIOAdapter.new(Pathname(__FILE__), &IGNORE_CHUNK)
    assert(path_adapter.close?)
    path_adapter.close

    enum_adapter = XTwitterScraper::Internal::Util::ReadIOAdapter.new([1].map(&:to_s).each, &IGNORE_CHUNK)
    enum_adapter.close
    assert_equal("1", enum_adapter.read)

    invalid_length = XTwitterScraper::Internal::Util::ReadIOAdapter.new(["a"].each, &IGNORE_CHUNK)
    assert_raises(NoMatchingPatternError) { invalid_length.read(:invalid) }
    invalid_output = XTwitterScraper::Internal::Util::ReadIOAdapter.new(["a"].each, &IGNORE_CHUNK)
    assert_raises(NoMatchingPatternError) { invalid_output.read(1, Object.new) }
    invalid_stream = XTwitterScraper::Internal::Util::ReadIOAdapter.new(Object.new, &IGNORE_CHUNK)
    assert_raises(NoMatchingPatternError) { invalid_stream.read }
  end

  def test_content_encoding_edges
    json_headers = {"content-type" => "application/json"}
    assert_equal([json_headers, "[1,true]"], XTwitterScraper::Internal::Util.encode_content(json_headers, [1, true]))

    jsonl_headers = {"content-type" => "application/jsonl"}
    headers, stream = XTwitterScraper::Internal::Util.encode_content(jsonl_headers, [1, {a: 2}])
    assert_equal(jsonl_headers, headers)
    assert_equal(["1", "{\"a\":2}"], stream.to_a)
    assert_equal([jsonl_headers, "raw"], XTwitterScraper::Internal::Util.encode_content(jsonl_headers, "raw"))

    assert_equal([{}, "symbol"], XTwitterScraper::Internal::Util.encode_content({}, :symbol))
    assert_equal([{}, "4"], XTwitterScraper::Internal::Util.encode_content({}, 4))
    assert_equal([{}, "text"], XTwitterScraper::Internal::Util.encode_content({}, StringIO.new("text")))

    part = XTwitterScraper::FilePart.new("part")
    assert_equal([{}, "part"], XTwitterScraper::Internal::Util.encode_content({}, part))
    object = Object.new
    assert_equal([{}, object], XTwitterScraper::Internal::Util.encode_content({}, object))

    multipart_headers = {"content-type" => "multipart/form-data"}
    _, primitive_stream = XTwitterScraper::Internal::Util.encode_content(multipart_headers, {items: [1, 2]})
    assert_equal(2, primitive_stream.to_a.join.scan("name=\"items\"").length)
    _, structured_stream = XTwitterScraper::Internal::Util.encode_content(multipart_headers, {items: [{a: 1}]})
    assert_includes(structured_stream.to_a.join, "[{\"a\":1}]")

    File.open(__FILE__) do |file|
      _, file_stream = XTwitterScraper::Internal::Util.encode_content(multipart_headers, {file: file})
      assert_includes(file_stream.to_a.join, "InternalEdgeCasesTest")
    end
  end

  def test_content_decoding_edges
    json_headers = {"content-type" => "application/json"}
    assert_nil(XTwitterScraper::Internal::Util.decode_content(json_headers, stream: [""]))
    assert_equal({a: 1}, XTwitterScraper::Internal::Util.decode_content(json_headers, stream: ["{\"a\":1}"]))
    assert_raises(JSON::ParserError) do
      XTwitterScraper::Internal::Util.decode_content(json_headers, stream: ["not json"])
    end
    assert_equal(
      "not json",
      XTwitterScraper::Internal::Util.decode_content(json_headers, stream: ["not json"], suppress_error: true)
    )

    jsonl = XTwitterScraper::Internal::Util.decode_content(
      {"content-type" => "application/jsonl"},
      stream: ["{\"a\":1}\n{\"b\":2}\n"]
    )
    assert_equal([{a: 1}, {b: 2}], jsonl.to_a)

    sse = XTwitterScraper::Internal::Util.decode_content(
      {"content-type" => "text/event-stream"},
      stream: ["unknown\n", "data: value\n"]
    )
    assert_equal([{event: nil, data: "value\n", id: nil, retry: nil}], sse.to_a)

    plain = XTwitterScraper::Internal::Util.decode_content(
      {"content-type" => "text/plain; charset=unknown-charset"},
      stream: ["text"]
    )
    assert_equal("text", plain.read)
    assert_nil(XTwitterScraper::Internal::Util.close_fused!(nil))
  end

  def test_sorbet_type_dispatch
    support = XTwitterScraper::Internal::Util::SorbetRuntimeSupport
    supported = Object.new
    supported.extend(support)
    supported.define_singleton_method(:to_sorbet_type) { :supported }

    assert_equal(:supported, support.to_sorbet_type(supported))
    assert_equal(String, support.to_sorbet_type(String))
    assert_equal(Object, support.to_sorbet_type(Object.new))

    namespace = Module.new
    namespace.extend(support)
    assert_raises(NameError) { namespace.const_get(:Missing) }
  end

  def test_transport_validation_and_retry_policy
    transport = XTwitterScraper::Internal::Transport::BaseClient

    assert_raises(ArgumentError) { transport.validate!(Object.new) }
    assert_raises(ArgumentError) { transport.validate!({unexpected: true}) }
    assert(transport.should_retry?(200, headers: {"x-should-retry" => "true"}))
    refute(transport.should_retry?(500, headers: {"x-should-retry" => "false"}))
    assert(transport.should_retry?(429, headers: {}))
    refute(transport.should_retry?(200, headers: {}))
    assert_nil(transport.reap_connection!(301, stream: nil))
    assert_nil(transport.reap_connection!(200, stream: nil))
  end

  def test_redirect_security_and_head_semantics
    transport = XTwitterScraper::Internal::Transport::BaseClient
    request = {
      method: :head,
      url: URI("https://example.com/start"),
      headers: {"content-type" => "application/json"},
      body: "body"
    }

    redirected = transport.follow_redirect(
      request,
      status: 303,
      response_headers: {"location" => "/next"}
    )
    assert_equal(:head, redirected.fetch(:method))
    assert_nil(redirected.fetch(:body))
    refute_includes(redirected.fetch(:headers), "content-type")

    assert_raises(XTwitterScraper::Errors::APIConnectionError) do
      transport.follow_redirect(
        request,
        status: 307,
        response_headers: {"location" => "http://example.com/insecure"}
      )
    end
  end

  def test_status_error_mapping
    url = URI("https://example.com")
    STATUS_ERRORS.each do |status, expected|
      error = XTwitterScraper::Errors::APIStatusError.for(
        url: url,
        status: status,
        headers: {},
        body: {},
        request: nil,
        response: nil
      )
      assert_instance_of(expected, error)
      assert_equal(status, error.status)
    end

    error = XTwitterScraper::Errors::APIStatusError.for(
      url: url,
      status: 418,
      headers: {},
      body: {},
      request: nil,
      response: nil,
      message: "Teapot"
    )
    assert_equal("Teapot", error.message)

    cause = ArgumentError.new("bad value")
    conversion = XTwitterScraper::Errors::ConversionError.new(
      on: String,
      method: :new,
      target: Integer,
      value: "bad",
      cause: cause
    )
    assert_same(cause, conversion.cause)
    assert_includes(conversion.message, "Cause: bad value")
  end

  def test_file_part_inputs
    assert_equal("text", JSON.parse(XTwitterScraper::FilePart.new("text").to_json))
    assert_equal("text", JSON.parse(XTwitterScraper::FilePart.new(StringIO.new("text")).to_json))
    assert_includes(JSON.parse(XTwitterScraper::FilePart.new(Pathname(__FILE__)).to_json), "InternalEdgeCasesTest")

    reader, writer = IO.pipe
    writer.write("pipe")
    writer.close
    part = XTwitterScraper::FilePart.new(reader)
    assert_equal("upload.txt", XTwitterScraper::FilePart.new("text", filename: "dir/upload.txt").filename)
    assert_nil(part.filename)
    assert_equal("pipe", JSON.parse(part.to_json))
  ensure
    reader&.close
    writer&.close unless writer&.closed?
  end

  def test_file_input_coercion_and_dumping
    file_input = XTwitterScraper::Internal::Type::FileInput
    # rubocop:disable Style/CaseEquality
    [Pathname(__FILE__), StringIO.new, "text", XTwitterScraper::FilePart.new("text")].each do |value|
      assert(file_input === value)
    end
    refute(file_input === Object.new)
    # rubocop:enable Style/CaseEquality

    string_state = XTwitterScraper::Internal::Type::Converter.new_coerce_state
    assert_instance_of(StringIO, file_input.coerce("text", state: string_state))
    io = StringIO.new("text")
    io_state = XTwitterScraper::Internal::Type::Converter.new_coerce_state
    assert_same(io, file_input.coerce(io, state: io_state))
    invalid_state = XTwitterScraper::Internal::Type::Converter.new_coerce_state
    invalid = Object.new
    assert_same(invalid, file_input.coerce(invalid, state: invalid_state))
    assert_instance_of(TypeError, invalid_state.fetch(:error))

    retry_state = {can_retry: true}
    assert_instance_of(XTwitterScraper::FilePart, file_input.dump("text", state: retry_state))
    assert(retry_state.fetch(:can_retry))

    reader, writer = IO.pipe
    dumped = file_input.dump(reader, state: retry_state)
    assert_instance_of(XTwitterScraper::FilePart, dumped)
    refute(retry_state.fetch(:can_retry))

    File.open(__FILE__) do |file|
      path_state = {can_retry: true}
      assert_same(file, file_input.dump(file, state: path_state))
      refute(path_state.fetch(:can_retry))

      wrapped_state = {can_retry: true}
      wrapped = XTwitterScraper::FilePart.new(file)
      assert_same(wrapped, file_input.dump(wrapped, state: wrapped_state))
      refute(wrapped_state.fetch(:can_retry))
    end
  ensure
    reader&.close
    writer&.close
  end
end
