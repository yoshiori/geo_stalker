# GeoStalker

Get your location using your around wifi access point.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "geo_stalker"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geo_stalker

## Usage

### Get api key

https://developers.google.com/maps/documentation/geolocation/get-api-key

### location

Ruby code

```ruby
require "geo_stalker"

stalker = GeoStalker::Locator.new(your_key)
stalker.location # {"location"=>{"lat"=>29.4222384, "lng"=>-98.4830782}, "accuracy"=>48.0}
```

Command line

```sh
GOOGLE_API_KEY=your_key geo_stalker | jq
{
  "location": {
    "lat": 29.4221035,
    "lng": -98.48321059999999
  },
  "accuracy": 37
}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec geo_stalker` to use the gem in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
