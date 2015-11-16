require "net/https"
require "uri"
require "json"

module GeoStalker
  class Locator
    class Base
      ENDPOINT = "https://www.googleapis.com/geolocation/v1/geolocate?key="

      def initialize(api_key)
        @api_key = api_key
      end

      def location
        https.start do
          request = Net::HTTP::Post.new(uri.request_uri)
          request.body = params.to_json
          request["Content-Type"] = "application/json"
          response = https.request(request)
          JSON.parse(response.body)
        end
      end

      private

      def wifi_access_points
        fail NotImplementedError, "You must implement #{self.class}##{__method__}"
      end

      def params
        { wifiAccessPoints: wifi_access_points }
      end

      def uri
        @uri ||= URI.parse(ENDPOINT + @api_key)
      end

      def https
        @https ||= begin
          https = Net::HTTP.new(uri.host, uri.port)
          https.use_ssl = true
          https.verify_mode = OpenSSL::SSL::VERIFY_NONE
          https
        end
      end
    end
  end
end
