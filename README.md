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

## Sample Output

```shell
# chef-client -W
Starting Chef Client, version 11.16.4
resolving cookbooks for run list: ["base", "kernel_parameters", "yum", "yum::proxy", "auditd", "timezone", "language", "selinux", "service", "crond", "incron", "sudo", "logging", "sysstat", "local_account", "iptables", "network", "network::interface", "openssh", "ntp", "manage"]
Synchronizing cookbooks
....................................done.
Compiling cookbooks
..............done.
Converging 173 resources
...S......SSSS............................................................S....S.........................S...........U.................................S.........................SS..........S....
System converged.

resources updated this run:
Recipe: chef::default
  * template[/etc/chef/client.rb]
  - Would update content in file /etc/chef/client.rb from 189d52 to 163298
    --- /etc/chef/client.rb     2015-02-12 07:50:03.505098752 +0900
    +++ /tmp/chef-rendered-template20150212-30944-1cmyzf5       2015-02-12 07:59:20.304103762 +0900
    @@ -7,15 +7,5 @@
     environment        'projct1-testing'
     ssl_verify_mode :verify_peer
     verify_api_cert true
    -require 'chef/formatters/simple'
    -class Chef::Client
    -  alias :orig_default_formatter :default_formatter
    -  def default_formatter
    -    if (STDOUT.tty? && !Chef::Config[:force_logger]) || Chef::Config[:force_formatter]
    -      [:simple]
    -    else
    -      [:null]
    -    end
    -  end
    -end
    +require            File.expand_path('../simple', __FILE__)
  - Would restore selinux security context
[2015-02-12T07:59:22+09:00] WARN: In whyrun mode, so NOT performing node save.
  chef client finished, 1 resources updated
#
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/chef-formatters-simple/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
