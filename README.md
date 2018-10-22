# NetHttpTimeoutErrors

Whether you use Net::HTTP or some higher abstraction like HTTParty, are you tired of having to rescue an ever-growing list of Net::HTTP timeout error types?

Just load this gem and then do:

``` ruby
begin
  uri = URI.parse("http://google.com/")
  response = Net::HTTP.get_response(uri)
rescue *NetHttpTimeoutErrors.all
  puts "It timed out some way or other!"
rescue AnotherError, *NetHttpTimeoutErrors.all
  puts "This works too."
end
```

Or if you prefer:

``` ruby
begin
  NetHttpTimeoutErrors.conflate do
    uri = URI.parse("http://google.com/")
    response = Net::HTTP.get_response(uri)
  end
rescue NetHttpTimeoutError
  puts "It timed out some way or other!"
end
```

You can still get at the original error through `NetHttpTimeoutError#original_error`.

Did we miss an error? Please add it!


## Installation

Add this line to your application's Gemfile:

    gem 'net_http_timeout_errors'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install net_http_timeout_errors


## Also see

There is also [net_http_exception_fix](https://github.com/edward/net_http_exception_fix) which cleverly tags these exceptions with a `Net::HTTPBroken` module that you can rescue.

You may prefer about *this* library that it very explicitly raises a single exception. The tagged exceptions are less obviously the same.

## License

Copyright (c) 2012 [Barsoom AB](http://barsoom.se)

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
