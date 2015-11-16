require "forwardable"

require "geo_stalker/locator/base"
require "geo_stalker/locator/darwin"

module GeoStalker
  class Locator
    extend Forwardable
    def_delegators :locator, :location

    def initialize(api_key)
      @api_key = api_key
    end

    private

    def locator
      @locator ||= begin
        case RUBY_PLATFORM
        when /darwin/
          GeoStalker::Locator::Darwin.new(@api_key)
        when /linux/
          GeoStalker::Locator::Linux.new(@api_key)
        end
      end
    end
  end
end
