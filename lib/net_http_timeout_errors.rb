require "net_http_timeout_errors/version"
require "net/http"

module Net
  class HTTP
    TIMEOUT_ERRORS = [
      Errno::ECONNREFUSED,
      Errno::ECONNRESET,
      Errno::EHOSTUNREACH,
      Errno::EPIPE,
      SocketError,
      Timeout::Error,
    ]
  end
end
