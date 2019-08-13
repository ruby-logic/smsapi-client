# Smsapi::Client

Smsapi::Client is a Ruby implementation for SMSAPI.pl gateway created by [Ruby Logic](http://rubylogic.pl)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'smsapi-client', '~> 1.0'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install smsapi-client -v '~> 1.0'

## Usage

Be sure you have a token. You can obtain it on [SMSAPI.pl](http://smsapi.pl)

```ruby
# Include the library
require 'smsapi'

# Create the client

client = Smsapi::Client.new('your_secret_token')

# Get credits (account details)
credits = client.credits
credits.balance        # => 2.6600
credits.pro_sms_limit  # => 16
credits.eco_sms_limit  # => 38
credits.mms_limit      # => 8
credits.vms_gsm_limit  # => 26
credits.vms_stac_limit # => 26

# Send a single text message
sms = client.send_single 500500500, 'Text Message'
sms.status   # 'OK'
sms.success? # => true
sms.points   # => 0.12

# When something goes wrong
sms.status        # 'ERROR'
sms.success?      # => false
sms.error?        # => true
sms.error_code    # => 101
sms.error_message # => 'Bad Credentials'

# Any additional options can be passed as last argument
sms = client.send_single 500500500, 'Text Message', test: '1'

# Sending a single PRO message. Remember to get authorisation for the name here: https://ssl.smsapi.pl/sms_settings/sendernames
sms = client.send_single 500500500, 'Text Message', from: 'Ruby Logic'

# Schedule a single message to be sent in the future
when = DateTime.new(2015, 10, 10)
sms = client.schedule_single 500500500, 'Text Message', when

# Sending messages in bulk
bulk = client.send_bulk [500500500, 600600600, 7007007], 'Text Message', test: '1'

# Gives access to an array of sent messages
bulk.sent
bulk.sent.first.success? # => true

# The api returns only statuses for successful messages. Since one of our
# numbers was too short the array contains only 2 items.
bulk.sent.count # => 2
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `smsapi.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/ruby-logic/smsapi-client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
