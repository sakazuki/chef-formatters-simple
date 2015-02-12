# Chef::Formatters::Simple

chef-client simple formatter

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chef-formatters-simple'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chef-formatters-simple

## Usage

Add below in /etc/chef/client.rb:

```
require 'chef/formatters/simple'
```

Use chef-client with -F or --format option

```bash
chef-client -F simple -W
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/chef-formatters-simple/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
