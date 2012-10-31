require "net_http_timeout_errors/version"
require "net/http"

module NetHttpTimeoutErrors
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
end
