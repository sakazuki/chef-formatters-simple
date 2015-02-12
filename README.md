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

```ruby
require 'chef/formatters/simple'
```

Use chef-client with -F or --format option

```bash
chef-client -F simple -W
```

When you want to use "simple" instead of "doc" for default, then add below in /etc/chef/client.rb:

```ruby
class Chef::Client
  alias :orig_default_formatter :default_formatter
  def default_formatter
    if (STDOUT.tty? && !Chef::Config[:force_logger]) || Chef::Config[:force_formatter]
      [:simple]
    else
      [:null]
    end
  end
end
```


## Contributing

1. Fork it ( https://github.com/[my-github-username]/chef-formatters-simple/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
