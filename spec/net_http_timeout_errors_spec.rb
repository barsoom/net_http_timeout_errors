require "minitest/autorun"
require "net_http_timeout_errors"

describe NetHttpTimeoutErrors, ".all" do
  it "has some" do
    NetHttpTimeoutErrors.all.wont_be_empty
  end

  # No assertions; more like runnable documentation.
  it "works splatted" do
    begin
      raise some_timeout_error
    rescue ZeroDivisionError, *NetHttpTimeoutErrors.all
    end
  end
end

describe NetHttpTimeoutErrors, ".conflate" do
  it "turns any handled error into a NetHttpTimeoutError" do
    assert_raises(NetHttpTimeoutError) do
      NetHttpTimeoutErrors.conflate do
        raise some_timeout_error
      end
    end
  end

  it "leaves other errors alone" do
    assert_raises(StandardError) do
      NetHttpTimeoutErrors.conflate do
        raise StandardError
      end
    end
  end

  it "keeps the original error" do
    begin
      NetHttpTimeoutErrors.conflate do
        raise some_timeout_error
      end
    rescue => e
      assert_instance_of some_timeout_error, e.original_error
    end
  end
end

def some_timeout_error
  SocketError
end
