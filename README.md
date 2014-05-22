# Reddcoin

A Ruby wrapper around [ReddAPI](https://reddapi.com), [Reddcoin's](https://reddcoin.com) API.

## Installation

Add this line to your application's Gemfile:

    gem 'reddcoin'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install reddcoin

## Usage

In order to use the library, you will first need to 

1. [Create a ReddAPI account](https://www.reddapi.com/CreateAccount)
2. Generate two access tokens. One for GET, and another for POST.

Once you have your access tokens, you can then start using the library.

```ruby
require 'reddcoin'

# Instantiate a new client
client = Reddcoin::Client.new(get:'GET-APIKEY', post:'POST-APIKEY')

# Create a new user
client.create_new_user('gary')

# Get a list of all users
client.get_user_list

# Get info for a single user
client.get_user_info('gary')

# Get a user's balance
client.get_user_balance('gary')

# Send to address
client.send_to_address('username_from', 'username_to', 'amount')
client.send_to_address('gary','glen','123.45')

# Move to user
client.move_to_user('username_from', 'username_to', 'amount')
client.move_to_user('gary','glen','123.45')
```

For now, all actions return the parsed response, with the exception of `get_user_list` and `get_user_info` which return User objects.

## TODO

- [ ] Objects instead of responses
- [ ] Write some tests
- [ ] Error handling

## Contributing

1. Fork it ( https://github.com/gary-rafferty/reddcoin/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
