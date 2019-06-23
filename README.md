# Ruboty::TrelloCleaner

A [Ruboty](https://github.com/r7kamura/ruboty) plugin to clean [Trello](http://trello.com) cards.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruboty-trello_cleaner'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruboty-trello_cleaner

## Usage

```
ruboty cleanup <BOARD_ID> <DELAY_IN_HOURS> <DONE_LIST_NAME> <TARGET_LIST_NAME1> <TARGET_LIST_NAME2> ...
```

* `BOARD_ID`: Trello board ID. You can get id from board URL.
* `DELAY_IN_HOURS`: If you set `3` for example, the cards created 3 hours ago will be moved.
* `DONE_LIST_NAME`: For example "Done". Cleaned card will be moved to this list.
* `TARGET_LIST_NAMEx`: For example "Agenda". Target list names.

## Configuration

You need to set these environment variables:

* `TRELLO_DEVELOPER_PUBLIC_KEY`: Trello Developer API key. You can obtain from https://trello.com/1/appKey/generate
* `TRELLO_MEMBER_TOKEN`: Trello member token. You can obtain from https://trello.com/1/connect?key=DEVELOPER_PUBLIC_KEY&name=ruboty&response_type=token&scope=read,write&expiration=never

## Author

@mzp

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

