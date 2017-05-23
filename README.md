# Fern API

## API DSL for Rails

Fern API is a reasonably unopinionated DSL for writing APIs in Rails.

## Installation

Add a reference to `fern-api` in your `Gemfile`:

```ruby
gem 'fern-api'
```

Include Fern in your base controller class:

```ruby
class ApplicationController < ActionController::API
  include Fern::Api
end
```

Or include it in individual controllers as-needed:

```ruby
class PostsController < ApplicationController
  include Fern::Api
end
```

## Documentation

### Defining Endpoints

Fern provides methods for `get`, `post`, `put`, and `delete`.

The basic structure of a request looks like this:

```ruby
get :index do
  request do
    # ...
  end
end
```

## License (MIT)

Copyright (c) 2017 Kyle Kestell

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.