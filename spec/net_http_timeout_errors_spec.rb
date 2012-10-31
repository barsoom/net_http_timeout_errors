require "minitest/autorun"
require "net_http_timeout_errors"

describe NetHttpTimeoutErrors, ".all" do
  it "has some" do
    NetHttpTimeoutErrors.all.wont_be_empty
  end

  # No assertions; more like runnable documentation.
  it "works splatted" do
    begin
      raise Timeout::Error
    rescue ZeroDivisionError, *NetHttpTimeoutErrors.all
    end
  end
end
