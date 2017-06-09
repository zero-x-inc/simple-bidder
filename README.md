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

## Configuring development environment

```
RACK_ENV=development rake db:drop
RACK_ENV=development rake db:create
RACK_ENV=development rake db:migrate
RACK_ENV=development rake db:seed
RACK_ENV=development rake db:test:prepare
```

## Firehose Schema

```
{
  "timestamp": "2017-05-29T07:30:35+00:00",
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
  "user_id": "ADGADFASDFASDF",
  "gender": "male",
  "yob": "1986"
}
```

## Creating new migration

```
bundle exec rake db:create_migration NAME=create_campaigns
```

## Generating random sample data

Start the web server:

```
TRANQUILITY_URI=https://shaman-proxy-staging.zero-x.co/v1/index/593a1a4ad68c54057090b38b/fa7cdcc2a478af82680070f61a3779a1 \
 bundle exec puma
```

Now run the script that sends bid requests, wins, and impressions to the web server.

```

```
