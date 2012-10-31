require "minitest/autorun"
require "net_http_timeout_errors"

describe Net::HTTP, "TIMEOUT_ERRORS" do
  it "has some" do
    Net::HTTP::TIMEOUT_ERRORS.wont_be_empty
  end
end
