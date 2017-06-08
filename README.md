# simple-bidder

## Setting Up

This project require `rbenv` to be installed with `ruby-2.2.5`.

Use `bundle install` to install all dependencies.

You'll also need a running instance of Tranquility to send data to when running the specs.

## Running Specs

```
RACK_ENV=test rake db:drop
RACK_ENV=test rake db:create
RACK_ENV=test rake db:migrate
RACK_ENV=test rake db:seed
RACK_ENV=test rake db:test:prepare
RACK_ENV=test bundle exec rspec
```

## Firehose Schema

```
{
  "timestamp": "2017-05-29T07:30:35+00:00",
  "bid_requests": 1,
  "type": "bid_request",
  "exchange_id": "ADFDFGDAF",
  "publisher_id": "DFHGFGNSDFG",
  "app_id": "OOKMASDFOIJASDFON",
  "site_id": "DFHSFHSFDGDFG",
  "device_id": "DFGSFGSDFGDSFASDFASDF",
  "country": "USA",
  "region": "CA",
  "city": "Los Angeles",
  "js": true,
  "make": "Apple",
  "model": "iPhone",
  "os": "iOS",
  "osv": "7.1",
  "dimension": "320x480",
  "blocked_attributes": ["1", "2"],
  "user_id": "ADGADFASDFASDF",
  "gender": "male",
  "yob": "1986"
}
```

## Creating new migration

```
bundle exec rake db:create_migration NAME=create_campaigns
```
