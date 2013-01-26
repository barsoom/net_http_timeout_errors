require "net_http_timeout_errors/version"
require "net/http"

class NetHttpTimeoutError < StandardError
  attr_reader :original_error

  def initialize(original_error)
    @original_error = original_error
  end
end

class NetHttpTimeoutErrors
  def self.all
    [
      Errno::ECONNREFUSED,
      Errno::ECONNRESET,
      Errno::EHOSTUNREACH,
      Errno::EPIPE,
      SocketError,
      Timeout::Error,
    ]
  end

  def self.conflate
    yield
  rescue *all => e
    raise NetHttpTimeoutError.new(e)
  end
end
